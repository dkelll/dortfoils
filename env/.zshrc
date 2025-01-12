# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/dev

export EDITOR="nvim"
export GPG_TTY=$(tty)
export PATH="$HOME/neovim/bin:$PATH"
export SF_USE_PROGRESS_BAR=false
export XDG_CONFIG_HOME=$HOME/.config

# your project folder that we can `c [tab]` to
export PROJECTS=~/projects

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

eval

## Aliases ##
alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command
alias vim='nvim' # Use nvim for my text editor
alias sforgs="cat ~/.sfdx/alias.json | jq -r .orgs"
alias vimrc='nvim $HOME/.config/nvim/' # Quick access to edit the config of  the best editor ever


export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($HOME/.local/scripts $fpath)

autoload -U $HOME/.local/scripts/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char
