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
fish_add_path "$HOME/.scripts"

# Env vars

set -gx EDITOR vim
set -gx SHELL (which fish)

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
  set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
end

# LLVM

if test (uname) = Darwin
  set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
  set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
end

# Aliases

### Git
#--- status
alias gs "git status"
#--- push
alias gp "git push"
#--- pull
alias glr "git pull --rebase"
#--- commit
alias gc "git commit"
alias gcm "git commit -m"
alias gca "git commit --amend"
#--- checkout
alias gco "git checkout"
alias gcob "git checkout -b"
#--- add
alias ga "git add"
alias gaa "git add ."
#--- reset
alias grsh "git reset --hard"
alias grs1 "git reset HEAD~1"
#--- diff
alias gd "git diff"
alias gds "git diff --staged"
#--- rebase
alias grb "git rebase"
alias grb2 "git rebase -i HEAD~2"
alias grb3 "git rebase -i HEAD~3"
alias grb4 "git rebase -i HEAD~4"
alias grb5 "git rebase -i HEAD~5"
#--- branch
alias gb "git branch"
alias gbr "git branch -r"
alias gbd "git branch -d"
#--- stash
alias gsh "git stash"
alias gshp "git stash pop"

## mise
alias m "mise"
alias mi "mise install"
alias mu "mise update"
alias mus "mise self-update"
alias me "mise exec"

## pnpm
alias p "pnpm"
alias pi "pnpm install"
alias pa "pnpm add"
alias pad "pnpm add -D"
alias pr "pnpm remove"
alias pe "pnpm exec"
alias px "pnpx"

## Cargo
alias c "cargo"
alias ci "cargo install"
alias ca "cargo add"
alias cr "cargo remove"
alias cb "cargo build"
alias ct "cargo test"

## Chezmoi
alias chu "chezmoi update"

## Turbo
alias t "pnpm exec turbo"

## YOLO
alias yoc "yolo.sh claude"