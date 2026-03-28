{ self, inputs, ... }:
{
  flake.nixosModules.user-jingus =
    { ... }:
    {
      niri-users = [ "jingus" ];
      wallpaper-users = [ "jingus" ];
    };
}
