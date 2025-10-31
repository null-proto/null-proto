{ pkgs , ... }: {
  gtk = {
    enable = true;

      #   cursorTheme = {
      #     # package = pkgs.breeze-hacked-cursor-theme;
      # name = "ArcMidnight-cursors";
      # size = 24;
      #   };


    font = {
      package = pkgs.nerd-fonts.comic-shanns-mono;
      name = "ComicShannsMono Nerd Font";
      size = 12;
    };

    iconTheme = {
      # package = pkgs.vimix-icon-theme;
      name  ="Colloid-Dark";
    };

    theme = {
      # package = pkgs.colloid-gtk-theme;
      name = "Colloid-Dark";
    };
  };
}
