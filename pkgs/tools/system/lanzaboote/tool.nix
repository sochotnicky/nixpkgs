{ rustPlatform, fetchFromGitHub, systemd, binutils-unwrapped, sbsigntool }:

rustPlatform.buildRustPackage {
  pname = "lanzaboote-tool";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "nix-community";
    repo = "lanzaboote";
    rev = "v0.3.0";
    hash = "sha256-Fb5TeRTdvUlo/5Yi2d+FC8a6KoRLk2h1VE0/peMhWPs=";
  };

  checkInputs = [
    binutils-unwrapped
    sbsigntool
  ];

  sourceRoot = "source/rust/tool";

  cargoHash = "sha256-g4WzqfH6DZVUuNb0jV3MFdm3h7zy2bQ6d3agrXesWgc=";

  TEST_SYSTEMD = systemd;
  RUST_BACKTRACE = "full";

  # TODO: limit supported platforms to UEFI
  meta.platforms = [ "x86_64-linux" "aarch64-linux" ]; # lib.platforms.uefi;
}
