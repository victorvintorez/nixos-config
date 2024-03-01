{ pkgs ? import <nixpkgs> { } }: {
  insomnium = pkgs.callPackage ./insomnium.nix {};
}