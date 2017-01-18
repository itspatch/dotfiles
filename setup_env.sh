#!/bin/bash

install_git_completion() {
  if [[ ! -e ~/.git-completion.bash ]]; then
    echo "downloading git auto-completion script"
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
  fi
}

setup_symlinks() {
  local dir=~/dotfiles
  local olddir=~/dotfiles_old/${date}
  local files=(
    .gitconfig
    .bashrc
    .bash_colors
    .profile
  )

  mkdir -p $olddir

  for file in ${files[*]}; do
    mv ~/$file $olddir/$file
    ln -s $dir/$file ~/$file
  done
}

main() {
  install_git_completion

  . .profile

  setup_symlinks
}

main
