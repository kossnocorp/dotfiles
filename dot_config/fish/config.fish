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
if test (whoami) = vscode
    envsource $HOME/.config/mothership/.env
end

# 1Password

if test (uname) = Darwin
    set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
end

# fnox

set FNOX_AGE_KEY "$(cat ~/.config/fnox/age.txt | grep "AGE-SECRET-KEY")"

# LLVM

if test (uname) = Darwin
    set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include
end

# Git

# If we're connected over ssh, use the remote config unless GIT_CONFIG_GLOBAL
# is already set.
if set -q SSH_CONNECTION; and not set -q GIT_CONFIG_GLOBAL
    set -x GIT_CONFIG_GLOBAL /home/koss/.config/git/remote.config
end

# Aliases

## mise
alias m mise
alias mi "mise install"
alias mu "mise update"
alias mus "mise self-update"
alias me "mise exec"

## pnpm
alias p pnpm
alias pi "pnpm install"
alias pa "pnpm add"
alias pad "pnpm add -D"
alias pr "pnpm remove"
alias pe "pnpm exec"
alias px pnpx

## Cargo
alias c cargo
alias ci "cargo install"
alias ca "cargo add"
alias cr "cargo remove"
alias cb "cargo build"
alias ct "cargo test"

## Chezmoi
alias chu "chezmoi update"
alias ce "chezmoi-extra.sh"
alias ces "chezmoi-extra.sh sync"

## Turbo
alias t "pnpm exec turbo"

## YOLO
alias yoc "yolo.sh claude"

## Agent shell
alias ash "agent-shell.sh"
