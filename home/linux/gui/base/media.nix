{
  pkgs,
  pkgs-unstable,
  ...
}:
# media - control and enjoy audio/video
{
  home.packages = with pkgs; [
    pavucontrol  # audio control
    imv # simple image viewer

  ];

}
