{ ... }: {
  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };

    rtkit.enable = true;

    pam.services.swaylock = {};
  };
}
