{pkgs, ...}: {
  home.packages = with pkgs; [
    # Misc
    tlrc
    cowsay

    thefuck

  ];

  programs = {
    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    # eza = {
    #   enable = true;
    #   git = true;
    #   extraOptions = [
    #     "--icons=always"
    #     "--color=always"
    #     "--long"
    #     "--no-filesize"
    #     "--no-time"
    #     "--no-user"
    #     "--no-permissions"
    #     "--group-directories-first"
    #     "--header"
    #   ];
    #   enableZshIntegration = true;
    # };

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

    # search for files by name, faster than find
    # fd = {
    #   enable = true;
    #   hidden = true;
    #   ignores = [
    #     ".git/"
    #   ];
    # };

    # zoxide is a smarter cd command, inspired by z and autojump.
    # It remembers which directories you use most frequently,
    # so you can "jump" to them in just a few keystrokes.
    # zoxide works on all major shells.
    #
    #   z foo              # cd into highest ranked directory matching foo
    #   z foo bar          # cd into highest ranked directory matching foo and bar
    #   z foo /            # cd into a subdirectory starting with foo
    #
    #   z ~/foo            # z also works like a regular cd command
    #   z foo/             # cd into relative path
    #   z ..               # cd one level up
    #   z -                # cd into previous directory
    #
    #   zi foo             # cd with interactive selection (using fzf)
    #
    #   z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
    # zoxide = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   options = [
    #     "--cmd cd"
    #   ];
    # };
  };
}
