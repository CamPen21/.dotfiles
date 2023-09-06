# Pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv init --path)"

# Golang variables
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

# NVM commands
export NVM_DIR=~/.nvm
if [[ "$OSTYPE" == "darwin"* ]]; then
    source $(brew --prefix nvm)/nvm.sh
else
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto      # update automatically without asking
source $ZSH/oh-my-zsh.sh

# Oh my zsh plugins
plugins=(git pyenv)

# Oh my posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
fi

# Load aliases
source $HOME/zsh/.alias

# Rust stuff
source $HOME/.cargo/env

# OS X specifics
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    source $HOME/zsh/.osx
fi
