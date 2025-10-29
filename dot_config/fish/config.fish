# Utils

# TODO: Move into a separate file?
function envsource
  for line in (cat $argv | grep -v '^#' |  grep -v '^\s*$' | sed -e 's/=/ /' -e "s/'//g" -e 's/"//g' )
    set export (string split ' ' $line)
    set -gx $export[1] $export[2]
  end
end

# Path

fish_add_path "$HOME/.local/bin"

# Env vars

set -gx EDITOR vim

# Homebrew

if test (uname) = Darwin
  eval (/opt/homebrew/bin/brew shellenv)
end

# mise-en-place

if type -q mise
  if status is-interactive
    mise activate fish | source
  else
    mise activate fish --shims | source
  end
else
  echo " mise-en-place not found, skipping..."
end

# Starship

if type -q starship
  starship init fish | source
else
  echo " Starship not found, skipping..."
end

# Mothership

# Test if running in a dev container
if test (whoami) = "vscode"
  envsource $HOME/.config/mothership/.env
end

# 1Password

if test (uname) = Darwin
  set -gx SSH_AUTH_SOCK "$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"
end

# Aliases

# Git
alias gst "git status"
alias gp "git push"
alias glr "git pull --rebase"
alias gc "git commit"
alias gco "git checkout"
alias gcob "git checkout -b"
alias gaa "git add ."
alias grh "git reset --hard"
alias grs "git reset HEAD~1"
alias gd "git diff"
alias gr2 "git rebase -i HEAD~2"
alias gr3 "git rebase -i HEAD~3"
alias gr4 "git rebase -i HEAD~4"
alias gr5 "git rebase -i HEAD~5"
alias gb "git branch"
alias gbr "git branch -r"

# mise
alias m "mise"
alias mi "mise install"
alias mu "mise update"
alias mus "mise self-update"
alias me "mise exec"

# pnpm
alias p "pnpm"
alias pi "pnpm install"
alias pa "pnpm add"
alias pad "pnpm add -D"
alias pr "pnpm remove"
alias pe "pnpm exec"
alias px "pnpx"

# Cargo
alias c "cargo"
alias ci "cargo install"
alias ca "cargo add"
alias cr "cargo remove"
alias cb "cargo build"
alias ct "cargo test"

# Chezmoi
alias chu "chezmoi update"

# Turbo
alias t "pnpm exec turbo"
