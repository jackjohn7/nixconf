{ self, inputs, ... }: {
  flake.nixosModules.development = { pkgs, lib, ... }: {
    programs.hyprland.enable = true;
  };
}
