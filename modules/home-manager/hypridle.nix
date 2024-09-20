{ config, pkgs, lib, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "hyprlock --immediate";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock --immediate";
      };

      listener = [
          {
            timeout = 200;
            on-timeout = "hyprlock";
          }
          {
            timeout = 250;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      
    };
  };
}
