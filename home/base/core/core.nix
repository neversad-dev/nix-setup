{pkgs, ...}: {
  home.packages = with pkgs; [
    # Misc
    tlrc
    cowsay
    cmatrix
    thefuck
    yq




  ];

  programs = {


    # a cat(1) clone with syntax highlighting and Git integration.
    bat = {
      enable = true;
    };

    # A command-line fuzzy finder
    # fzf = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
    #   fileWidgetCommand = "fd --type=f --hidden --strip-cwd-prefix --exclude .git";
    #   fileWidgetOptions = ["--preview 'bat -n --color=always --line-range :500 {}'"];
    #   changeDirWidgetCommand = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
    #   changeDirWidgetOptions = ["--preview 'eza --tree --color=always {} | head -200'"];
    #   defaultOptions = [
    #     "--height 40%"
    #     "--border"
    #   ];
    # };


  };
}
