{
  ...
}: {
  programs.zsh.initExtra = ''
    if [[ $(uname -m) == 'arm64' ]]; then
      export PATH="/opt/homebrew/bin:$PATH"
    else
      export PATH="/usr/local/bin:$PATH"
    fi
  '';
}
