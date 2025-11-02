{ ... } : {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    fish.enable = true;
    adb.enable = true;
    ssh.startAgent = true;

  #   hyprland = {
  #     enable = true;
  #     xwayland.enable = false;
  #   };
  };
}
