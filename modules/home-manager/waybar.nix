{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "mpris" ];
        modules-right = [ "backlight" "privacy" "wireplumber" "disk" "load" "memory" "battery" "tray" "clock" ];
  
        "hyprland/workspaces" = {
          all-outputs = true;
          on-click = "activate";
        };
	    "wireplumber" = {
          "format" = "{icon} {volume}%";
          "format-muted" = "󰝟";
          "on-click" = "set-mute @DEFAULT_SINK@ toggle";
          "max-volume" = 150;
          "scroll-step" = 0.2;
	  format-icons = [ "󰕿" "󰖀" "󰕾" ];
        };
	    disk = {
          format = " {specific_free:0.0f}GB";
	      unit = "GB";
	    };
        "mpris" = {
          "format" = "{player_icon} {title}";
          "format-paused" = "{status_icon} <i>{title}</i>";
          "player-icons" = {
            "default" = "";
            "mpv" = "";
          };
          "status-icons" = {
            "paused" = "";
          };
          max-length = 50;
          "ignored-players" = [ "firefox" ];
        };
        "clock" = {
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "format" = " {:%H:%M %m/%d/%Y}";
        };
        "calendar" = {
          "mode" = "year";
          "mode-mon-col" = 3;
          "weeks-pos" = "right";
          "on-scroll" = 1;
          "format" = {
            "months" = "<span color='#ffead3'><b>{}</b></span>";
            "days" = "<span color='#ecc6d9'><b>{}</b></span>";
            "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
            "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
            "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
        "actions" =  {
          "on-click-right" = "mode";
          "on-click-forward" = "tz_up";
          "on-click-backward" = "tz_down";
          "on-scroll-up" = "shift_up";
          "on-scroll-down" = "shift_down";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{icon}";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
        };
        "battery" = {
          "states" = {
              "warning" = 30;
              "critical" = 15;
          };
          "format-icons" = [ "󰁺" "󰁻"  "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          "format" = "{icon} {capacity}%";
         # "format-charging" = " {capacity}%";
         # "format-plugged" = " {capacity}%";
          "format-alt" = "{time}";
        };
      };
    };
    style = ''
      @import "./mocha.css";
      
      * {
        font-family: Fira Code;
        font-size: 17px;
        min-height: 0;
      }
      
      #waybar {
        background: transparent;
        color: @text;
        margin: 5px 5px;
      }
      
      #workspaces {
        border-radius: 1rem;
        margin: 5px;
        background-color: @surface0;
        margin-left: 1rem;
      }
      
      #workspaces button {
        color: @lavender;
        border-radius: 1rem;
        padding: 0.4rem;
      }
      
      #workspaces button.active {
        color: @sky;
        border-radius: 1rem;
      }
      
      #workspaces button:hover {
        color: @sapphire;
        border-radius: 1rem;
      }
      
      #custom-music,
      #backlight,
      #privacy,
      #network,
      #wireplumber,
      #disk,
      #load,
      #memory,
      #battery,
      #tray,
      #clock {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }
      
      #clock {
        color: @blue;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }
      
      #battery {
        color: @green;
      }
      
      #battery.charging {
        color: @green;
      }
      
      #battery.warning:not(.charging) {
        color: @red;
      }
      
      #backlight {
        color: @yellow;
        margin-left: 1rem;
        border-radius: 1rem 0px 0px 1rem;
      }
      
      #wireplumber {
        color: @maroon;
      }
      
      #tray {
          border-radius: 0px 0px 0px 0px
      }
    '';
  };
}
