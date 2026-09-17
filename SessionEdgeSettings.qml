// Defaults here must match SessionEdgeDaemon.qml: until a value is saved,
// the daemon uses its own fallback.

import QtQuick
import qs.Common
import qs.Modules.Plugins

PluginSettings {
    id: root
    pluginId: "sessionEdge"

    ToggleSetting {
        settingKey: "on"
        label: I18n.trFor("sessionEdge", "Show session strip")
        description: I18n.trFor("sessionEdge", "A slim strip on the chosen edge that slides in on hover.")
        defaultValue: true
    }

    SelectionSetting {
        settingKey: "edge"
        label: I18n.trFor("sessionEdge", "Edge")
        description: I18n.trFor("sessionEdge", "The frame surrounds all four sides, so the strip can dock to any of them. The docking area is widest on the side of the DMS bar.")
        defaultValue: "right"
        options: [
            {
                label: I18n.trFor("sessionEdge", "Right"),
                value: "right"
            },
            {
                label: I18n.trFor("sessionEdge", "Left"),
                value: "left"
            },
            {
                label: I18n.trFor("sessionEdge", "Top"),
                value: "top"
            },
            {
                label: I18n.trFor("sessionEdge", "Bottom"),
                value: "bottom"
            },
            {
                label: I18n.trFor("sessionEdge", "Same as the DMS bar"),
                value: "bar"
            }
        ]
    }

    SelectionSetting {
        settingKey: "position"
        label: I18n.trFor("sessionEdge", "Position along the edge")
        defaultValue: "center"
        options: [
            {
                label: I18n.trFor("sessionEdge", "Center"),
                value: "center"
            },
            {
                label: I18n.trFor("sessionEdge", "Start"),
                value: "start"
            },
            {
                label: I18n.trFor("sessionEdge", "End"),
                value: "end"
            }
        ]
    }

    SliderSetting {
        settingKey: "edgeOffset"
        label: I18n.trFor("sessionEdge", "Offset from start or end")
        description: I18n.trFor("sessionEdge", "Only applies when the position is not Center.")
        defaultValue: 0
        minimum: 0
        maximum: 400
        unit: "px"
    }

    SliderSetting {
        settingKey: "triggerSize"
        label: I18n.trFor("sessionEdge", "Idle strip width")
        description: I18n.trFor("sessionEdge", "Width of the sensitive zone while the strip is hidden. Small enough, it stays inside the frame and takes no space from windows.")
        defaultValue: 8
        minimum: 2
        maximum: 40
        unit: "px"
    }

    SliderSetting {
        settingKey: "triggerLength"
        label: I18n.trFor("sessionEdge", "Length of the sensitive zone")
        description: I18n.trFor("sessionEdge", "Only this part of the edge reacts, so the strip does not open every time the pointer passes by.")
        defaultValue: 220
        minimum: 40
        maximum: 1200
        unit: "px"
    }

    SliderSetting {
        settingKey: "openSize"
        label: I18n.trFor("sessionEdge", "Button size")
        defaultValue: 52
        minimum: 28
        maximum: 120
        unit: "px"
    }

    SliderSetting {
        settingKey: "openDelay"
        label: I18n.trFor("sessionEdge", "Open delay")
        description: I18n.trFor("sessionEdge", "Keeps the strip from popping up when the pointer only passes by.")
        defaultValue: 180
        minimum: 0
        maximum: 2000
        unit: "ms"
    }

    SliderSetting {
        settingKey: "closeDelay"
        label: I18n.trFor("sessionEdge", "Close delay")
        defaultValue: 500
        minimum: 0
        maximum: 5000
        unit: "ms"
    }

    ToggleSetting {
        settingKey: "show_lock"
        label: I18n.trFor("sessionEdge", "Lock")
        description: I18n.trFor("sessionEdge", "Acts immediately, no hold needed.")
        defaultValue: true
    }

    ToggleSetting {
        settingKey: "show_suspend"
        label: I18n.trFor("sessionEdge", "Suspend")
        defaultValue: true
    }

    ToggleSetting {
        settingKey: "show_hibernate"
        label: I18n.trFor("sessionEdge", "Hibernate")
        description: I18n.trFor("sessionEdge", "Only shown if the system supports it.")
        defaultValue: false
    }

    ToggleSetting {
        settingKey: "show_logout"
        label: I18n.trFor("sessionEdge", "Log out")
        defaultValue: true
    }

    ToggleSetting {
        settingKey: "show_reboot"
        label: I18n.trFor("sessionEdge", "Reboot")
        defaultValue: true
    }

    ToggleSetting {
        settingKey: "show_poweroff"
        label: I18n.trFor("sessionEdge", "Power off")
        defaultValue: true
    }

    ToggleSetting {
        settingKey: "show_dmsrestart"
        label: I18n.trFor("sessionEdge", "Restart shell")
        description: I18n.trFor("sessionEdge", "Restarts DMS. Acts immediately, no hold needed. Note: tray icons of apps that do not re-register stay gone afterwards.")
        defaultValue: true
    }
}
