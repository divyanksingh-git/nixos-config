{}:{
    "layer" = "top";
    "position" = "top";
    "height" = 24;
    "spacing" = 0;

    modules-left = ["hyprland/workspaces"];
    modules-center =  ["hyprland/window"];
    modules-right = ["pulseaudio" "network" "backlight" "battery" "clock"];

    "clock" = {
        "format" = "{:%I:%M} 󰔟";
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        "format-alt" = "{:%Y-%m-%d}";
    };
    "backlight" = {
        "format" = "{percent}% {icon}";
        "format-icons" = ["" "" "" "" "" "" "" "" ""];
        "on-scroll-up" = "light -A 1";
        "on-scroll-down" = "light -U 1";
    };
    "battery" = {
        "states" = {
            "warning" = 30;
            "critical" = 15;
        };
        "format" = "{capacity}% {icon}";
        "format-charging" = "{capacity}% ";
        "format-plugged" = "{capacity}% ";
        "format-alt" = "{time} {icon}";
        "format-icons" = ["" "" "" "" ""];
    };
    "network" = {
       "format-wifi" = "{essid} ({signalStrength}%) ";
        "format-ethernet" = "{ipaddr}/{cidr} ";
        "tooltip-format" = "{ifname} via {gwaddr} ";
        "format-linked" = "{ifname} (No IP) ";
        "format-disconnected" = "Disconnected ⚠";
        "format-alt" = "{ifname}: {ipaddr}/{cidr}";
    };
    "pulseaudio" = {
        "format" = "{volume}% {icon} {format_source}";
        "format-bluetooth" = "{volume}% {icon} {format_source}";
        "format-bluetooth-muted" = "󰟎  {format_source}";
        "format-muted" = "󰝟 {format_source}";
        "format-source" = "{volume}% ";
        "format-source-muted" = "";
        "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
        };
        "on-click" = "pavucontrol";
    };
}
