if [[ -d ~/.oh-my-zsh/custom ]]; then
  rm -rf ~/.oh-my-zsh/custom
fi
if [[ -f ~/.zshrc ]]; then
  rm -rf ~/.zshrc
fi

cp -r custom ~/.oh-my-zsh
cp .zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
