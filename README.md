# To setup to analyze and browse with my rust-analyzer & Emacs config:

1. Generate the "build" directory needed by `~/.config/emacs/my/lib/my-rust-lang-proj.el`:
   ```shell
   ./x check --build-dir /var/tmp/$HOME/rust-lang/build-for-rust-analyzer
   ```
   Apparently, this doesn't require entering the nix-shell environment of `./shell.nix`.
   (But doing `./x build` would.)
