{ self, inputs, ... }: {
  flake.nixosModules.development = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      vim
      git
      zed-editor
    ];
  };
}
