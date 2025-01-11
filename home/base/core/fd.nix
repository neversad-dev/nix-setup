{pkgs, ...}: {
    # search for files by name, faster than find
    fd = {
      enable = true;
      hidden = true;
      ignores = [
        ".git/"
      ];
    };
}