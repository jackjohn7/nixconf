{ self, inputs, ... }:
{
  flake.nixosModules.wallpapers =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {

      options.wallpaper-users = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
        description = "List of users to include wallpapers for";
      };

      options.wallpaper-destination = lib.mkOption {
        type = lib.types.str;
        default = "Pictures/Wallpapers";
        description = "Destination path for wallpapers";
      };

      config = {
        hjem = lib.mkIf (config.wallpaper-users != [ ]) {
          users = lib.genAttrs config.wallpaper-users (username: {
            enable = true;
            files = {
              "${config.wallpaper-destination}".source = pkgs.runCommand "wallpapers" { } ''
                mkdir -p $out
                cp -r ${../../../assets/wallpapers}/* $out/
              '';
            };
          });
        };
      };
    };
}
