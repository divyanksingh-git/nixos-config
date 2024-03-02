{}:''
general {
    disable_loading_bar = false
    hide_cursor = true
}

background {
    monitor = eDP-1
    path = /home/vokun/.config/hypr/background.png
    blur_passes =  # 0 disables blurring
    blur_size = 1
}

input-field {
    monitor =
    size = 250, 50
    outline_thickness = 0
    outer_color = rgb(151515)
    inner_color = rgb(200, 200, 200)
    font_color = rgb(10, 10, 10)
    fade_on_empty = true
    placeholder-text = <i>Input Password...</i>

    position = 0, -30
    halign = center
    valign = center
}

label {
    monitor =
    text = Hi there, $USER
    color = rgba(200, 200, 200, 1.0)
    font_size = 25
    font_family = Noto Sans

    position = 0, 40
    halign = center
    valign = center
}
''
