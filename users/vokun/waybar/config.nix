{}:
''
{
    "backlight": {
      "device": "intel_backlight",
      "format": "{percent}% {icon}",
      "format-icons": ["", "", "", "", "", "", "", "", ""],
      "on-scroll-down": "light -U 1",
      "on-scroll-up": "light -A 1"
    },
    "battery": {
      "format": "{capacity}% {icon}",
      "format-alt": "{time} {icon}",
      "format-charging": "{capacity}% ",
      "format-icons": [
        "",
        "",
        "",
        "",
        ""
      ],
      "format-plugged": "{capacity}% ",
      "states": {
        "critical": 15,
        "warning": 30
      }
    },
    "clock": {
      "format": "{:%I:%M} 󰔟",
      "format-alt": "{:%Y-%m-%d}",
      "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
    },
    "height": 24,
    "layer": "top",
    "modules-center": [
      "hyprland/window"
    ],
    "modules-left": [
      "hyprland/workspaces"
    ],
    "modules-right": [
      "pulseaudio",
      "network",
      "backlight",
      "battery",
      "clock"
    ],
    "network": {
      "format-alt": "{ifname}: {ipaddr}/{cidr}",
      "format-disconnected": "Disconnected ⚠",
      "format-ethernet": "{ipaddr}/{cidr} ",
      "format-linked": "{ifname} (No IP) ",
      "format-wifi": "{essid} ({signalStrength}%) ",
      "tooltip-format": "{ifname} via {gwaddr} "
    },
    "output": "eDP-1",
    "position": "top",
    "pulseaudio": {
      "format": "{volume}% {icon} {format_source}",
      "format-bluetooth": "{volume}% {icon} {format_source}",
      "format-bluetooth-muted": "󰟎  {format_source}",
      "format-icons": {
        "car": "",
        "default": [
          "",
          "",
          ""
        ],
        "hands-free": "",
        "headphone": "",
        "headset": "",
        "phone": "",
        "portable": ""
      },
      "format-muted": "󰝟 {format_source}",
      "format-source": "{volume}% ",
      "format-source-muted": ""
    },
    "spacing": 0
}
''
