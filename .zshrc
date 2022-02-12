# Enable vi mode
bindkey -v
export KEYTIMEOUT=1
autoload colors && colors


# Change My prompt
PS1="%F{14}%2d%f %B%(?.%F{112}ζ%f.%F{196}ζ%f)%b "
RPS1='-- INSERT --'

# Show what mode I am in
function zle-keymap-select {
     # Block cursor when normal mode
     if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
    
     # Beam cursor when insert mode
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi

    #sees keymap state and changes text displayes accordingly
    RPS1=""${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --} 
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-keymap-select

function zle-line-init() {
    zle -K viins
    echo -ne '\e[6 q'
}

zle -N zle-line-init

echo -ne '\e[6 q'
preexec() { echo -ne '\e[6 q'; }

#better tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#use vim bindings for traversing through tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#Some magic for C-c error handling
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

#Some QOL aliases
alias ls="exa --icons --group-directories-first -F"
alias la="exa --icons --group-directories-first -aF"
alias ll="exa --long -F --group-directories-first --icons"
alias grep="grep --color=always"
alias icat="kitty +kitten icat"
alias cdp="cd ~/Coding-Adventures/CSES/"
alias cdm="cd ~/Documents/Manim_Ende/My\ Projects"
alias cdmh="cd ~/Documents/Manim_Ende/Helping-People"
alias cdev="cd ~/git-repos/manim"

# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

#PATH variable
export PATH="$HOME/Library/TinyTeX/bin/universal-darwin:$HOME/.poetry/bin:$PATH"

# Load zsh-syntax-highlighting; should be last.
source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 