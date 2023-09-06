PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
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
fi
