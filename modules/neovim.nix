{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
      # Executables
      ripgrep
      fd
      fzf

      # LSPs
      lua-language-server
      nil
      nixpkgs-fmt

      # Lazy
      nodejs
    ];
    programs.neovim = {
	enable = true;
	viAlias = true;
	vimAlias = true;
    };
}
