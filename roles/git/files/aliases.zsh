alias gs="git status"    # Show Git status
alias ga="git add ."     # Add all files to the staging area
alias gc="git commit -m" # Commit with a message
alias gp="git push"      # Push the current branch to the remote
alias gl="git pull"      # Pull from the remote branch
alias glog="git log --oneline --graph --all --decorate" # View Git log in one-line format
alias gco="git checkout" # Checkout a branch
alias gcb="git checkout -b" # Create and switch to a new branch
alias gd="git diff --cached" # View the difference of staged changes
alias grh="git reset --hard HEAD" # Hard reset to the latest commit
alias gb="git branch -vv"  # Show branches and last commit in one-line format
alias gf="git fetch --all" # Fetch all remote branches

# Create a New Branch and Push It
# Usage: gnew branch_name
gnew() {
  git checkout -b "$1"
  git push -u origin "$1"
}

# Quick Commit and Push
# Usage: gquick "commit message"
gquick() {
  got add .
  git commit -m "$1"
  git push
}

# Rebase Current Branch onto Main
# Usage: grebase
grebase() {
  git fetch
  git rebase origin/main
}

# Undo the Last Commit
# Usage: gundo
gundo() {
  git reset --soft HEAD~1
}

# Squash Commits
# Usage: gsquash 3 (to squash the last 3 commits)
gsquash() {
  git reset --soft HEAD~"$1"
  git commit --amend
}

# Sync Fork with Upstream
# Usage: gupdate-fork
gupdate-fork() {
  git fetch upstream
  git checkout main
  git merge upstream/main
  git push origin main
}

# Interactive Rebase on Previous Commits
# Usage: grebasei 3 (to interactively rebase the last 3 commits)
grebasei() {
  git rebase -i HEAD~"$1"
}

# Show Git Tree
# Usage: glogtree
glogtree() {
  git log --graph --oneline --decorate --all
}

# Reset Branch to Remote
# Usage: gresetremote
gresetremote() {
  git fetch origin
  git reset --hard origin/"$(git rev-parse --abbrev-ref HEAD)"
}
