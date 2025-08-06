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

# pnpm
alias p "pnpm"
alias pi "pnpm install"
alias pa "pnpm add"
alias pad "pnpm add -D"
alias pr "pnpm remove"
alias pe "pnpm exec"
alias px "pnpx"

# mise
alias m "mise"
alias mi "mise install"
alias mu "mise update"
alias mus "mise self-update"
alias me "mise exec