# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set PATH, MANPATH, etc., for Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load and customize the powerlevel10k theme
source "$(brew --prefix powerlevel10k)/powerlevel10k.zsh-theme"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable iTerm2 integration
[[ ! -f ~/.iterm2_shell_integration.zsh ]] || source ~/.iterm2_shell_integration.zsh

# Enable asdf integration
source "$(brew --prefix asdf)/libexec/asdf.sh"

# Command aliases
[[ ! -f ~/.zsh_aliases ]] || source ~/.zsh_aliases

# Add VS Code CLI to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add $HOME/bin to PATH
if [[ -d "$HOME/bin" ]]; then
  PATH="$HOME/bin:$PATH"
fi

# Use 1Password for SSH keys and other API tokens
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
source ~/.config/op/plugins.sh

# Initialize ZSH completion
autoload -Uz compinit && compinit

# Enable ZSH history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
