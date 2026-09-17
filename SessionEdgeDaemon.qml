// SessionEdge: session actions in a slim strip that slides in from a screen edge.
//
// The strip is a DankPopout, not a layer window of its own. In connected frame
// mode a DankPopout registers with the frame (ConnectedModeState), so the frame
// draws its surface: shared outline, shared glass tone, shared slide motion.
// A separate window can only imitate the colors and never lines up.
//
// What remains of a window is an invisible hover sensor along the edge.

pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.Common
import qs.Services
import qs.Widgets

Item {
    id: daemon

    readonly property var _settings: SettingsData.pluginSettings

    function cfg(key, fallback) {
        return SettingsData.getPluginSetting("sessionEdge", key, fallback);
    }

    readonly property bool enabled: {
        daemon._settings;
        return cfg("on", true);
    }
    readonly property string alignment: {
        daemon._settings;
        return cfg("position", "center");
    }
    readonly property int sensorThickness: {
        daemon._settings;
        return Math.max(2, Math.min(60, cfg("triggerSize", 8)));
    }
    readonly property int sensorLength: {
        daemon._settings;
        return Math.max(40, Math.min(1200, cfg("triggerLength", 220)));
    }
    readonly property int buttonSize: {
        daemon._settings;
        return Math.max(28, Math.min(120, cfg("openSize", 52)));
    }
    readonly property int openDelay: {
        daemon._settings;
        return Math.max(0, Math.min(2000, cfg("openDelay", 180)));
    }
    readonly property int closeDelay: {
        daemon._settings;
        return Math.max(0, Math.min(5000, cfg("closeDelay", 500)));
    }
    readonly property int edgeOffset: {
        daemon._settings;
        return Math.max(-2000, Math.min(2000, cfg("edgeOffset", 0)));
    }

    // ------------------------------------------------------------------ docking side
    // setTriggerPosition takes the side as a parameter, so the strip can dock to
    // any frame edge, not only the bar side. Next to the bar the frame piece is
    // frameBarSize thick, elsewhere frameThickness.
    readonly property var barConfig: (SettingsData.barConfigs && SettingsData.barConfigs.length) ? SettingsData.barConfigs[0] : null
    readonly property int barSide: daemon.barConfig ? (daemon.barConfig.position ?? 0) : 0

    readonly property int barPosition: {
        daemon._settings;
        const edge = daemon.cfg("edge", "right");
        if (edge === "bar")
            return daemon.barSide;
        return {
            "top": 0,
            "bottom": 1,
            "left": 2,
            "right": 3
        }[edge] ?? 3;
    }
    readonly property bool vertical: daemon.barPosition === 2 || daemon.barPosition === 3

    readonly property real barThickness: {
        if (!Theme.isConnectedEffect)
            return Theme.barHeight;
        return daemon.barPosition === daemon.barSide ? SettingsData.frameBarSize : SettingsData.frameThickness;
    }
    readonly property real barSpacing: daemon.barConfig ? (daemon.barConfig.spacing ?? 4) : 4

    // Same hold duration as the DMS power menu
    readonly property int holdMs: Math.max(100, SettingsData.powerActionHoldDuration * 1000)

    // ------------------------------------------------------------------ actions
    readonly property var allActions: [
        {
            key: "lock",
            icon: "lock",
            hold: false
        },
        {
            key: "suspend",
            icon: "bedtime",
            hold: true
        },
        {
            key: "hibernate",
            icon: "mode_cool",
            hold: true
        },
        {
            key: "logout",
            icon: "logout",
            hold: true
        },
        {
            key: "reboot",
            icon: "restart_alt",
            hold: true
        },
        {
            key: "poweroff",
            icon: "power_settings_new",
            hold: true
        },
        {
            key: "dmsrestart",
            icon: "refresh",
            hold: false
        }
    ]

    readonly property var actions: {
        daemon._settings;
        const shown = [];
        for (const a of daemon.allActions) {
            if (!daemon.cfg("show_" + a.key, a.key !== "hibernate"))
                continue;
            if (a.key === "hibernate" && !SessionService.hibernateSupported)
                continue;
            shown.push(a);
        }
        return shown;
    }

    Process {
        id: shellRestart
        command: ["dms", "restart"]
        running: false
    }

    function run(key) {
        popout.close();
        switch (key) {
        case "lock":
            IdleService.lockRequested();
            return;
        case "dmsrestart":
            shellRestart.running = true;
            return;
        case "suspend":
            SessionService.suspend();
            return;
        case "hibernate":
            SessionService.hibernate();
            return;
        case "logout":
            SessionService.logout();
            return;
        case "reboot":
            SessionService.reboot();
            return;
        case "poweroff":
            SessionService.poweroff();
            return;
        }
    }

    // ------------------------------------------------------------------ hold state
    property string holdAction: ""
    property real holdProgress: 0

    function cancelHold() {
        holdTimer.stop();
        daemon.holdAction = "";
        daemon.holdProgress = 0;
    }

    Timer {
        id: holdTimer
        interval: 16
        repeat: true
        onTriggered: {
            daemon.holdProgress = Math.min(1, daemon.holdProgress + interval / daemon.holdMs);
            if (daemon.holdProgress < 1)
                return;
            stop();
            const key = daemon.holdAction;
            daemon.cancelHold();
            daemon.run(key);
        }
    }

    Timer {
        id: closeTimer
        interval: daemon.closeDelay
        onTriggered: {
            daemon.cancelHold();
            popout.close();
        }
    }

    // Centre of the sensitive zone along the edge, for a given screen length
    function sensorCenter(totalLength) {
        if (daemon.alignment === "start")
            return daemon.edgeOffset + daemon.sensorLength / 2;
        if (daemon.alignment === "end")
            return totalLength - daemon.edgeOffset - daemon.sensorLength / 2;
        return totalLength / 2 + daemon.edgeOffset;
    }

    function openOn(screen) {
        if (!screen || daemon.actions.length === 0)
            return;
        const center = daemon.sensorCenter(daemon.vertical ? screen.height : screen.width);
        const x = daemon.vertical ? (daemon.barPosition === 2 ? daemon.barThickness : screen.width - daemon.barThickness) : center;
        const y = daemon.vertical ? center : (daemon.barPosition === 0 ? daemon.barThickness : screen.height - daemon.barThickness);
        popout.setTriggerPosition(x, y, daemon.sensorLength, "center", screen, daemon.barPosition, daemon.barThickness, daemon.barSpacing, daemon.barConfig);
        popout.open();
    }

    // dms ipc call sessionEdge toggle
    IpcHandler {
        target: "sessionEdge"

        function toggle(): string {
            if (popout.shouldBeVisible) {
                popout.close();
                return "closed";
            }
            daemon.openOn(Quickshell.screens.length > 0 ? Quickshell.screens[0] : null);
            return "opened";
        }
    }

    // ------------------------------------------------------------------ popout
    // The gap towards the screen edge is smaller than the inner one because the
    // frame already sits between popout and edge; both gaps then look equal.
    readonly property real innerMargin: Theme.spacingM
    readonly property real edgeMargin: Math.max(0, Theme.spacingM - (Theme.isConnectedEffect ? SettingsData.frameThickness : 0))
    readonly property real popoutThickness: daemon.buttonSize + daemon.innerMargin + daemon.edgeMargin
    readonly property real popoutLength: daemon.actions.length * daemon.buttonSize + Math.max(0, daemon.actions.length - 1) * Theme.spacingXS + daemon.innerMargin * 2

    DankPopout {
        id: popout

        layerNamespace: "dms:plugins:sessionEdge"
        popupWidth: daemon.vertical ? daemon.popoutThickness : daemon.popoutLength
        popupHeight: daemon.vertical ? daemon.popoutLength : daemon.popoutThickness
        hoverDismissEnabled: true

        // Required while backgroundInteractive is on (the default): the popout
        // adds a full-screen catcher that would otherwise swallow every click.
        onBackgroundClicked: {
            daemon.cancelHold();
            popout.close();
        }

        onPopoutClosed: daemon.cancelHold()

        content: Component {
            Item {
                anchors.fill: parent

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.NoButton
                    onEntered: closeTimer.stop()
                    onExited: closeTimer.restart()
                }

                Grid {
                    anchors.left: daemon.barPosition === 2 ? parent.left : undefined
                    anchors.right: daemon.barPosition === 3 ? parent.right : undefined
                    anchors.top: daemon.barPosition === 0 ? parent.top : undefined
                    anchors.bottom: daemon.barPosition === 1 ? parent.bottom : undefined
                    anchors.leftMargin: daemon.edgeMargin
                    anchors.rightMargin: daemon.edgeMargin
                    anchors.topMargin: daemon.edgeMargin
                    anchors.bottomMargin: daemon.edgeMargin
                    anchors.horizontalCenter: daemon.vertical ? undefined : parent.horizontalCenter
                    anchors.verticalCenter: daemon.vertical ? parent.verticalCenter : undefined

                    columns: daemon.vertical ? 1 : daemon.actions.length
                    rows: daemon.vertical ? daemon.actions.length : 1
                    spacing: Theme.spacingXS

                    Repeater {
                        model: daemon.actions

                        delegate: Rectangle {
                            id: button

                            required property var modelData

                            readonly property bool holding: daemon.holdAction === button.modelData.key
                            readonly property bool dangerous: button.modelData.key === "poweroff" || button.modelData.key === "reboot"

                            width: daemon.buttonSize
                            height: daemon.buttonSize
                            radius: Theme.cornerRadius
                            color: mouse.containsMouse ? Theme.primaryHoverLight : Theme.surfaceHover
                            clip: true

                            Rectangle {
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                height: parent.height * (button.holding ? daemon.holdProgress : 0)
                                visible: button.holding
                                color: {
                                    if (button.modelData.key === "poweroff")
                                        return Theme.errorSelected;
                                    if (button.modelData.key === "reboot")
                                        return Theme.withAlpha(Theme.warning, 0.3);
                                    return Theme.primarySelected;
                                }
                            }

                            DankIcon {
                                anchors.centerIn: parent
                                name: button.modelData.icon
                                size: Theme.iconSize
                                color: {
                                    if (!mouse.containsMouse && !button.holding)
                                        return Theme.surfaceText;
                                    if (!button.dangerous)
                                        return Theme.primary;
                                    return button.modelData.key === "poweroff" ? Theme.error : Theme.warning;
                                }
                            }

                            MouseArea {
                                id: mouse

                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onEntered: closeTimer.stop()
                                onExited: daemon.cancelHold()
                                onPressed: {
                                    if (!button.modelData.hold) {
                                        daemon.run(button.modelData.key);
                                        return;
                                    }
                                    daemon.holdAction = button.modelData.key;
                                    daemon.holdProgress = 0;
                                    holdTimer.restart();
                                }
                                onReleased: daemon.cancelHold()
                                onCanceled: daemon.cancelHold()
                            }
                        }
                    }
                }
            }
        }
    }

    // ------------------------------------------------------------------ sensor
    // Draws nothing: a transparent strip at the edge that only notices the pointer.
    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            id: sensor

            required property var modelData

            readonly property real center: daemon.sensorCenter(daemon.vertical ? sensor.screen.height : sensor.screen.width)

            screen: sensor.modelData
            visible: daemon.enabled && daemon.actions.length > 0
            color: "transparent"

            WlrLayershell.namespace: "sessionedge-sensor"
            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            anchors {
                left: daemon.barPosition === 2 || !daemon.vertical
                right: daemon.barPosition === 3 || !daemon.vertical
                top: daemon.barPosition === 0 || daemon.vertical
                bottom: daemon.barPosition === 1 || daemon.vertical
            }

            // Right at the screen edge the pointer stops by itself. Only on the bar
            // side the sensor sits behind the bar, which is on Top as well and
            // would cover it.
            readonly property real inset: daemon.barPosition === daemon.barSide ? daemon.barThickness : 0

            margins {
                left: daemon.barPosition === 2 ? sensor.inset : 0
                right: daemon.barPosition === 3 ? sensor.inset : 0
                top: daemon.barPosition === 0 ? sensor.inset : 0
                bottom: daemon.barPosition === 1 ? sensor.inset : 0
            }

            implicitWidth: daemon.vertical ? daemon.sensorThickness : 0
            implicitHeight: daemon.vertical ? 0 : daemon.sensorThickness

            MouseArea {
                x: daemon.vertical ? 0 : sensor.center - daemon.sensorLength / 2
                y: daemon.vertical ? sensor.center - daemon.sensorLength / 2 : 0
                width: daemon.vertical ? parent.width : daemon.sensorLength
                height: daemon.vertical ? daemon.sensorLength : parent.height
                hoverEnabled: true
                acceptedButtons: Qt.NoButton

                onEntered: {
                    closeTimer.stop();
                    openTimer.restart();
                }
                onExited: {
                    openTimer.stop();
                    closeTimer.restart();
                }

                Timer {
                    id: openTimer
                    interval: daemon.openDelay
                    onTriggered: daemon.openOn(sensor.screen)
                }
            }
        }
    }
}
