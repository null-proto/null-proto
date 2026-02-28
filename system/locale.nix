{  pkgs, ... }:
{
  # default spelling 
  i18n.defaultLocale = "en_US.UTF-8";
  
  # local measurements
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  console = {
    earlySetup = true;
    font = "ter-i18b";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  fonts = {
    fontDir.enable = true;
    fontconfig.useEmbeddedBitmaps = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
			openmoji-color
			# whatsapp-emoji-font
			joypixels

      inter
			atkinson-hyperlegible-next
			atkinson-hyperlegible-mono

      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.comic-shanns-mono
      nerd-fonts.victor-mono
			nerd-fonts.hurmit
			nerd-fonts.terminess-ttf
			nerd-fonts.dejavu-sans-mono
      maple-mono.NF 
      terminus_font

			google-fonts
    ];

		fontconfig.defaultFonts = {
			emoji = [ "Noto Color Emoji" "OpenMoji Color" ];
			sansSerif = [ "ComicShannsMono Nerd Font" "Noto Color Emoji" ];
			serif = [ "Atkinson Hyperlegible Next" "Noto Color Emoji" ];
			monospace = [ 
# "ComicShannsMono Nerd Font" 
				"JetBrainsMonoNL Nerd Font Propo"
				"Noto Color Emoji" 
			];
		};


		# fontconfig.defaultFonts.emoji = [ "Joypixels" "Whatsapp Emoji Font" ];
		};

}
