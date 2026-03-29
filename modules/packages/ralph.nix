{ self, inputs, ... }:
{
  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.ralph = pkgs.rustPlatform.buildRustPackage rec {
        pname = "ralph-cli";
        version = "2.5.1";

        src = pkgs.fetchFromGitHub {
          owner = "mikeyobrien";
          repo = "ralph-orchestrator";
          rev = "v${version}";
          sha256 = "sha256-K3/nTun6mwFwYagKtQDlKsnTpoAMRy62x5TtfRMRjQc=";
        };

        cargoHash = "sha256-BuCM2CAXRR8GqUyFvgpAECVXdeafzuViiX8EtzbHGoY=";
        doCheck = false;
      };
    };
}
