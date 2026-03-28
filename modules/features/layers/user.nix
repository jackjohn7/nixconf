{ self, inputs, ... }:
{
  flake.nixosModules.user =
    { pkgs, lib, ... }:
    {
      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.jingus = {
        isNormalUser = true;
        description = "jingus";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
        packages = with pkgs; [
          #  thunderbird
        ];
      };
    };
}
