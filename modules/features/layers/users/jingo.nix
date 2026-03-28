{ self, inputs, ... }:
{
  flake.nixosModules.user-jingo =
    { ... }:
    {
      hyprland-users = [ "jingo" ];
      wallpaper-users = [ "jingo" ];
    };
}
