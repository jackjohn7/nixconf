{ self, inputs, ... }: {
  flake.nixosModules.user-jingo = { ... }: {
    hyprland-users = [ "jingo" ];
  };
}
