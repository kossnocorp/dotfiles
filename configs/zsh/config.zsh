# Assign OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  export OS="macos"
elif [[ "$(uname)" == "Linux" ]]; then
  export OS="linux"
fi

# Add scripts to PATH
export PATH="$SCRIPTS_PATH/$OS:$SCRIPTS_PATH/common:$PATH"