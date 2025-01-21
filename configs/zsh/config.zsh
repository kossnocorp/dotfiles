#region Variables

# Assign OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  export OS="macos"
elif [[ "$(uname)" == "Linux" ]]; then
  export OS="linux"
fi

# Add scripts to PATH
SCRIPTS_PATH="$HOME/src/dotfiles/scripts"
export PATH="$SCRIPTS_PATH/$OS:$SCRIPTS_PATH/common:$PATH"

#endregion

#region Aliases

# Git
alias glr="git pull --rebase" 
alias grh="git reset --hard" 
alias gcob="git checkout -b"

# GitHub CLI
alias ghco="gh pr checkout"

# nw
alias n="nw"

# Just
alias j="just"

# pnpm
alias p="pnpm"
alias pe="pnpm exec"
alias pr="pnpm run"
alias pi="pnpm install"
alias px="pnpx"
alias pu='pnpm -F "*" upgrade'

#endregion