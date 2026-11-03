# Development shell for the HydroQC documentation site (Hugo + Docsy Hugo module).
#
# Pinned to the nixpkgs revision whose Hugo is 0.166.0 (extended), the version
# Docsy 0.18.1 is officially supported and tested against.
#
# Usage:
#   nix-shell
#   hugo server -D
#
# Bump the pin only when the Docsy/Hugo support matrix moves.

{ pkgs ? import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/2aaad40284de035b66973164ac212b8cfaeab9a6.tar.gz";
    sha256 = "sha256-YybsRakbPLcUiHMv5rwrh01CKbSiBhQTp/gNBXWbSFc=";
  }) { }
}:
pkgs.mkShell {
  packages = with pkgs; [
    # Site build (Hugo extended is required for SCSS; 0.166.0)
    hugo
    # `hugo mod get` / `hugo mod tidy` / module downloads
    go
    git
    cacert
    # Docsy 0.18 scripts pipeline: `hugo mod npm pack`, npm install, Bootstrap +
    # Font Awesome come from node_modules (LTS 24 is the supported version).
    nodejs_24
    # Docsy >= 0.17 requires the Dart Sass CLI on PATH (Hugo no longer bundles
    # LibSass). nixpkgs ships 1.104.0 (> theme minimum 1.95.0).
    dart-sass
  ];

  # Keep Go module/toolchain downloads inside the sandbox-friendly defaults.
  GOTOOLCHAIN = "local";

  shellHook = ''
    echo "hugo     $(hugo version)"
    echo "sass     $(sass --version)"
    echo "go       $(go version | cut -d' ' -f3)"
    echo "node     $(node --version)"
    echo
    echo "First run in a fresh checkout:"
    echo "  hugo mod get && hugo mod npm pack && npm install"
  '';
}
