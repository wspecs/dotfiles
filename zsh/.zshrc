
## Node ZSH Helper methods

git_init() {
  git init
  git add --all
  git commit -m 'first commit'
  git remote add origin https://github.com/wspecs/$1.git
  git push -u origin master
}

push_to_git() {
  git pull
  git status
  git add --all
  git commit -m $1
  git push
}
