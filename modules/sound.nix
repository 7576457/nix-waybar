{
  format = "{icon}";
  format-bluetooth = "{icon}";
  format-muted = "{icon}";
  format-icons = {
    default = [ "󰖁" "󰕿" "󰖀" "󰕾" ];
    "default-muted" = "󰝟";
    headphone = "";
    "headphone-muted" = "󰟎";
    headset = "";
    "headset-muted" = "󰟎";
    hands-free = "";
    "hands-free-muted" = "󰟎";
  };
  scroll-step = 10;
  max-volume = 100;
  target = "sink";
  cursor = true;
  on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
  tooltip = false;
}
