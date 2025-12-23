HISTFILE=~/.histfile #Autocompletion history setup
HISTSIZE=5000
SAVEHIST=5000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt PROMPT_SUBST

bindkey -v

zstyle :compinstall filename '/home/$USER/.zshrc' #Edit to change user directory
zstyle ':completion::complete:*' gain-privileges 1 #Allow autocompletion in privileged environmetns
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit

# Keybinds
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# setup key accordingly 
[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"          beginning-of-line
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"           end-of-line
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"        overwrite-mode
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"     backward-delete-char
[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"        delete-char
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"            up-line-or-history
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"          down-line-or-history
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"          backward-char
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"         forward-char
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
            
# Finally, make sure the terminal is in application mode, when zle is  
# active. Only then are the values from $terminfo valid.            
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then            
	autoload -Uz add-zle-hook-widget            
	function zle_application_mode_start { echoti smkx }            
	function zle_application_mode_stop { echoti rmkx }            
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start   
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop  
fi            
            
# History Search            
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search 
zle -N up-line-or-beginning-search            
zle -N down-line-or-beginning-search            
            
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
            
autoload -Uz run-help # Add help command to zsh            
(( ${+aliases[run-help]} )) && unalias run-help            
alias help=run-help            
            
# Add color aliases for common commands            
if [ -x /usr/bin/dircolors ]; then            
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'            
	            
	alias grep='grep --color=auto'            
	alias fgrep='fgrep --color=auto'            
	alias egrep='egrep --color=auto'            
fi            

# Other common aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sudo='sudo '

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# If on Arch, and you want to hook zsh into pacman to auto-rehash upon package changes, uncomment the following lines, and add the next block of lines to /etc/pacman.d/hooks/zsh.hook


# Add various directories to Path

export PATH=$PATH:/home/$USER/.local/bin:/etc/profile

export PATH=$PATH:/home/$USER/.cargo/bin
export PATH=$PATH:/root/.cargo/bin


PROMPT='$(prmt --code $? "{path:cyan} {git:purple} {rust:red:s: 🦀} {python:yellow:m: 🐍} {time:dim}\n{ok:green}{fail:red} ")'

# Initialize starship and zoxide
# eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# User aliases
alias v=nvim
alias vi=nvim
alias vim=nvim   
alias cd=z 
alias ls='eza --icons=always'
alias l='eza --icons=always'
alias stl=systemctl
alias ..='cd ..'

export EDITOR="nvim"

function mkcd() {
  mkdir $1 && cd $1
}

function cdls() {
  cd $1 && ls
}

function gitp() {
  git add . && git commit -m $1 && git push
}


source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

