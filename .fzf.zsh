# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jonathan/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/jonathan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jonathan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jonathan/.fzf/shell/key-bindings.zsh"
