{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
      eza
      ripgrep
      prmt
    ];
    programs.zoxide = {
	enable = true;
	enableZshIntegration = true;
	options = [
	    "--cmd cd"
	];
    };
    programs.zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	history.size = 10000;
	initContent = ''
	    HISTFILE=~/.histfile #Autocompletion history setup
	    HISTSIZE=5000
	    SAVEHIST=5000
	    PROMPT='$(prmt --code $? "{env::USER}@{env::HOSTNAME} {path:cyan} {git:purple} {rust:red:s: 🦀} {python:yellow:m: 🐍} {time:dim}\n{ok:green}{fail:red} ")'
	    export HOSTNAME=$(hostname)
	    export EDITOR=nvim

	    autoload -Uz compinit
	    compinit

	    bindkey '^[[A' history-search-backward
	    bindkey '^[[B' history-search-forward
	'';
	setOptions = [
	    "share_history"
	    "hist_expire_dups_first"
	    "hist_ignore_dups"
	    "hist_verify"
	    "PROMPT_SUBST"
	];
	shellAliases = {
	    ls = "eza --icons=always";
	    l = "eza --icons=always";
	    stl = "systemctl";
	    ll = "ls -alF";
	    ".." = "cd ..";
	    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#keesNix";
	    nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles#keesNix";
	};
	siteFunctions = {
	    mkcd = ''
		mkdir "$1" && cd "$1"
	    '';
	    gitp = ''
		git add . && git commit -m "$1" && git push
	    '';
	    cdls = ''
		cd "$1" && eza --icons=always
	    '';
	};
    };
}
