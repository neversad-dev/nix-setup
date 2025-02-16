{
  config,
  pkgs-unstable,
  ...
}: {
  home = {
    packages = [ 
      pkgs-unstable.hyprshot 
    ]; 

  };
}
