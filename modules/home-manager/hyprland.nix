{config, lib, pkgs, inputs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      monitor = ",highres, auto, auto";
      xwayland = {
        force_zero_scaling = true;
      };
      env = "GDK_SCALE,1";

      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun";
      "$mod" = "SUPER";

      bind = [
        "$mod, F, exec, brave"
        "$mod, T, exec, kitty"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, E, exec, $fileManager"
        "$mod, V, togglefloating"
        "$mod, R, exec, $menu"
        "$mod, P, pseudo, # dwindle"
        "$mod, J, togglesplit, # dwindle"

        # Move focus
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, N, movefocus, d"
        "$mod, P, movefocus, u"

         # Switch workspaces with mainMod + [0-9]
         "$mod, 1, workspace, 1"
         "$mod, 2, workspace, 2"
         "$mod, 3, workspace, 3"
         "$mod, 4, workspace, 4"
         "$mod, 5, workspace, 5"
         "$mod, 6, workspace, 6"
         "$mod, 7, workspace, 7"
         "$mod, 8, workspace, 8"
         "$mod, 9, workspace, 9"
         "$mod, 0, workspace, 10"

         # Move active window to a workspace with mainMod + SHIFT + [0-9]
         "$mod SHIFT, 1, movetoworkspace, 1"
         "$mod SHIFT, 2, movetoworkspace, 2"
         "$mod SHIFT, 3, movetoworkspace, 3"
         "$mod SHIFT, 4, movetoworkspace, 4"
         "$mod SHIFT, 5, movetoworkspace, 5"
         "$mod SHIFT, 6, movetoworkspace, 6"
         "$mod SHIFT, 7, movetoworkspace, 7"
         "$mod SHIFT, 8, movetoworkspace, 8"
         "$mod SHIFT, 9, movetoworkspace, 9"
         "$mod SHIFT, 0, movetoworkspace, 10"

         # Example special workspace (scratchpad)
         "$mod, S, togglespecialworkspace, magic"
         "$mod SHIFT, S, movetoworkspace, special:magic"

         # Scroll through existing workspaces with mainMod + scroll
         "$mod, mouse_down, workspace, e+1"
         "$mod, mouse_up, workspace, e-1"

         # Move/resize windows with mainMod + LMB/RMB and dragging
         #"$mod, mouse:272, movewindow"
         #"$mod, mouse:273, resizewindow"
      ];

    };

    extraConfig = ''
    env = XCURSOR_SIZE,24
    env = HYPRCURSOR_SIZE,24 

      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hyprland.org/Configuring/Variables/

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general { 
          gaps_in = 5
          gaps_out = 5

          border_size = 2

          # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)

          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = false 

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false

          layout = dwindle
      }

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration {
          rounding = 10

          # Change transparency of focused and unfocused windows
          active_opacity = 1.0
          inactive_opacity = 1.0

          drop_shadow = true
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)

          # https://wiki.hyprland.org/Configuring/Variables/#blur
          blur {
              enabled = true
              size = 3
              passes = 1

              vibrancy = 0.1696
          }
      }

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations {
          enabled = true

          # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle {
          pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # You probably want this
      }

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master {
          new_status = master
      }

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc { 
          force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
      }
                
      # https://wiki.hyprland.org/Configuring/Variables/#input
      input  {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 1

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

        touchpad  {
          natural_scroll = false
        }
      }

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures  {
        workspace_swipe = false
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device  {
        name = epic-mouse-v1
        sensitivity = -0.5
      } 
      
    '';
  };
}
