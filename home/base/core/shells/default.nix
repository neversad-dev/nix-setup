{...}: {


  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
    };

    bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
