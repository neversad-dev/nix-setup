{
  config,
  myvars,
  ...

}: {
  home.homeDirectory = "/home/${myvars.username}";

}
