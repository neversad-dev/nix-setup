{myvars, ...} @ args: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${myvars.username}" = {
    home = "/Users/${myvars.username}";
    description = myvars.userfullname;
  };
}
