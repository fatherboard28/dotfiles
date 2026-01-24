if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#launch tmux on start
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  cd $HOME
  exec tmux
fi

#make zinit dir
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#install zinit if not already
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#source zinit
source "${ZINIT_HOME}/zinit.zsh"

#===================================================================================
#Plugins
#===================================================================================
#install powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

#syntax highlighting
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

#autosuggestions
zinit light zsh-users/zsh-autosuggestions
#-----------------------------------------------------------------------------------

#===================================================================================
#System Vars
#===================================================================================
export PATH=$HOME/bin:$HOME/.roswell/bin:/usr/local/bin:~/scripts:$PATH
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

#-----------------------------------------------------------------------------------

#===================================================================================
#Keybinds
#===================================================================================
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
#-----------------------------------------------------------------------------------

#===================================================================================
#Settings
#===================================================================================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#completions style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

zinit cdreplay -q

#-----------------------------------------------------------------------------------

#===================================================================================
#Personal Alias
#===================================================================================
alias la='ls --color -a'
alias k=kubectl
#-----------------------------------------------------------------------------------

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(~/.local/bin/mise activate)"
#To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jonathan/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
