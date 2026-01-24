{ ... } : {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    fish.enable = true;
    ssh.startAgent = true;

    # virt-manager.enable = true;


  #   hyprland = {
  #     enable = true;
  #     xwayland.enable = false;
  #   };
  };
}
