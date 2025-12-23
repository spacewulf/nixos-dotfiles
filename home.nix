{ config, pkgs, inputs, lib, ... }:

let 
freecadWayland = pkgs.symlinkJoin {
	name = "freecad-wayland-fix";
	paths = [
		pkgs.freecad-wayland
	];
	buildInputs = [ pkgs.makeWrapper ];
	postBuild = ''
		wrapProgram $out/bin/FreeCAD \
		--prefix MESA_LOADER_DRIVER_OVERRIDE : zink \
		--prefix __EGL_VENDOR_LIBRARY_FILENAMES : ${pkgs.mesa}/share/glvnd/egl_vendor.d/50_mesa.json \
		'';
};
theme = "${pkgs.base16-schemes}/share/themes/catpuccin-latte.yaml";
dotfiles = "${config.home.homeDirectory}/.config/nix/config";
create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
configs = {
	qtile = "qtile";
	niri = "niri";
	nvim = "nvim";
	ghostty = "ghostty";
	# zsh = "zsh";
};
in 
{ 
	imports = [
		./modules/neovim.nix
		./modules/zsh.nix
		./modules/tmux.nix
			inputs.stylix.homeModules.stylix
			inputs.dms.homeModules.dankMaterialShell.default
	];
	# home.file.".config/.zshrc".source = ./config/zsh/.zshrc;
	xdg.configFile = builtins.mapAttrs  (name: subpath: {
			source = create_symlink "${dotfiles}/${subpath}";
			recursive = true;
			}) configs;
	home.username = "kees";
	home.homeDirectory = "/home/kees";
	stylix = {
		enable = true;
		targets.neovim.enable = false;
		base16Scheme = {

			base00 = "161616";
			base01 = "252525";
			base02 = "353535";
			base03 = "484848";
			base04 = "7b7c7e";
			base05 = "f2f4f8";
			base06 = "b6b8bb";
			base07 = "e4e4e5";
			base08 = "ee5396";
			base09 = "3ddbd9";
			base0A = "08bdba";
			base0B = "25be6a";
			base0C = "33b1ff";
			base0D = "78a9ff";
			base0E = "be95ff";
			base0F = "ff7eb6";
		};
	};
	programs.dankMaterialShell = {
		enable = true;
		systemd = {
			enable = true;
			restartIfChanged = true;
		};
		enableSystemMonitoring = true;
		enableClipboard = true;
		enableDynamicTheming = true;
		enableAudioWavelength = true;
		enableCalendarEvents = true;
	};
	programs.git.enable = true;
	home.stateVersion = "25.11";
	home.packages = with pkgs; [
		freecadWayland
			playerctl
			prmt
			librewolf
			cryptsetup
			ghostty
			orca-slicer
			spotify
			xwayland-satellite
			ripgrep
			nil
			nixpkgs-fmt
			nodejs
			gcc
			cmake
			unzip
			legcord
	];
	programs.bash = {
		enable = true;
		shellAliases = {
			ll = "ls -alF";
			".." = "cd ..";
			nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#keesNix";
		};
	};

}
