{
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    settings = {
      command = "${pkgs.tmux}/bin/tmux attach || ${pkgs.tmux}/bin/tmux new -s $USER";
    };
  };
}
