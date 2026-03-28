{ self, inputs, ... }:
{
  flake.nixosModules.cursors =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      options.cursor-users = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
        description = "List of users to configure cursors for";
      };

      config = {
        # Install cursor packages system-wide
        environment.systemPackages = with pkgs; [
          bibata-cursors
        ];

        # Set up XDG data directories for cursor themes
        environment.pathsToLink = [ "/share/icons" ];

        # Configure hjem for specified users - set cursor theme in user config
        hjem = lib.mkIf (config.cursor-users != [ ]) {
          users = lib.genAttrs config.cursor-users (username: {
            enable = true;
            files = {
              # GTK cursor settings
              ".config/gtk-3.0/settings.ini".text = ''
                [Settings]
                gtk-cursor-theme-name=Bibata-Modern-Ice
                gtk-cursor-theme-size=24
              '';
              # X11/Wayland cursor environment
              ".config/environment.d/cursor.conf".text = ''
                XCURSOR_THEME=Bibata-Modern-Ice
                XCURSOR_SIZE=24
                HYPRCURSOR_THEME=Bibata-Modern-Ice
                HYPRCURSOR_SIZE=24
              '';
            };
          });
        };
      };
    };
}
