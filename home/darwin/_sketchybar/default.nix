{ lib, pkgs, ...} :{

  home.activation.sketchybar = lib.hm.dag.entryAfter ["writeBoundary"] ("${pkgs.sketchybar}/bin/sketchybar --reload");

  home.file.".config/sketchybar/sketchybarrc".source = ./sketchybarrc;
  home.file.".config/sketchybar/plugins".source = ./plugins;
  
} 