let

  sources = import ./nix/sources.nix;
  nixpkgs = sources.nixpkgs;
  pkgs = import nixpkgs {};

in pkgs.mkShell rec {
  name = "nas-shell";

  buildInputs = with pkgs; [
    niv
    ansible_2_10
  ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}
  '';
}
