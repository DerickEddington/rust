{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    # To only build Rust with host system's libLLVM:
    curl git unstable.llvmPackages_18.libllvm libxml2 pkg-config python3

    # # To also build LLVM from source (comment-out the above):
    # cmake gcc gnumake ninja openssl  curl git libxml2 pkg-config python3
  ];

  shellHook = ''
    # Per ./config.toml
    export RUSTFLAGS="-C target-cpu=native"
    export RUSTFLAGS_BOOTSTRAP="-C opt-level=3 -C debuginfo=0"
    export RUSTFLAGS_NOT_BOOTSTRAP="-Z tune-cpu=native -C inline-threshold=0"

    # # Slight chance this might help with running `rust-analyzer` on ./library/**.
    # export RUSTC_BOOTSTRAP=1
  '';
}
