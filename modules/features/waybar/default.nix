{ self, inputs, ... }:
{
  flake.nixosModules.waybar =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      config = {
        environment.systemPackages = with pkgs; [
          waybar
        ];

        # Configure hjem for specified users
        hjem = lib.mkIf (config.hyprland-users != [ ]) {
          users = lib.genAttrs config.hyprland-users (username: {
            enable = true;
            files = {
              ".config/waybar/".source = pkgs.runCommand "waybar" { } ''
                mkdir -p $out
                cp -r ${./config}/* $out/
              '';
            };
          });
        };
      };
    };
}
