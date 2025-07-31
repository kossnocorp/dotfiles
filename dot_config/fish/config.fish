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

# Aliases

# Git
alias gst "git status"
alias gp "git push"
alias gl "git pull --rebase"
alias gc "git commit"
alias gco "git checkout"
alias gcob "git checkout -b"
alias gaa "git add ."
alias grh "git reset --hard"
alias gr "git reset HEAD~1"

# pnpm
alias p "pnpm"
alias pi "pnpm install"
alias pa "pnpm add"
alias pad "pnpm add --dev"
alias pr "pnpm remove"
alias pe "pnpm exec"
alias px "pnpx"