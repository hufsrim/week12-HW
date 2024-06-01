{ pkgs }: {
  deps = [
    pkgs.systemdStage1Network
    pkgs.vim
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}