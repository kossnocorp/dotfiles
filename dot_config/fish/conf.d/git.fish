# Config

# If we're connected over ssh, use the remote config unless GIT_CONFIG_GLOBAL
# is already set.
if set -q SSH_CONNECTION; and not set -q GIT_CONFIG_GLOBAL
    set -x GIT_CONFIG_GLOBAL /home/koss/.config/git/remote.config
end

# Aliases

# status
alias gs "git status"

# log
alias gl "git log --oneline --graph --decorate"
alias glg "git log"

# push
alias gp "git push"

# pull
alias glr "git pull --rebase"

# fetch
alias gfa "git fetch --all"

# commit
alias gc "git commit"
alias gcm "git commit -m"
alias gca "git commit --amend"

# checkout
alias gco "git checkout"
alias gcob "git checkout -b"

# add
alias ga "git add"
alias gaa "git add ."

# reset
alias grs1 "git reset HEAD~1"
alias grsh "git reset --hard"

# diff
alias gd "git diff"
alias gds "git diff --staged"

# rebase
alias gr "git rebase"
alias gri "git rebase --interactive"
alias gr2 "git rebase -i HEAD~2"
alias gr3 "git rebase -i HEAD~3"
alias gr4 "git rebase -i HEAD~4"
alias gr5 "git rebase -i HEAD~5"
alias grc "git rebase --continue"
alias grm "git rebase main"
alias gra "git rebase --abort"

# branch
alias gb "git branch"
alias gbr "git branch -r"
alias gbd "git branch -D"

# stash
alias gsh "git stash"
alias gshp "git stash pop"

# cherry-pick
alias gcp "git cherry-pick"
