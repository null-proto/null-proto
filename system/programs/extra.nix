{ pkgs , ... }: {
  environment.systemPackages = with pkgs; [
    #-- un-free & sus
    _7zz
    unrar
  ];
}
