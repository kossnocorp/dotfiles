if [[ "$OSTYPE" == "darwin"* ]]; then
  export OS="macos"
elif [[ "$(uname)" == "Linux" ]]; then
  export OS="linux"
fi

# Add scripts to PATH
SCRIPTS_PATH="$HOME/src/dotfiles/scripts"
export PATH="$SCRIPTS_PATH/$OS:$SCRIPTS_PATH/common:$PATH"