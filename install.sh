tar cfz ~/.vimbackup.tgz ~/.vim ~/.vimrc
rm -rf ~/.vim ~/.vimrc
git clone git://github.com/zentrification/vim.git /tmp/zentrification-vim
mv /tmp/zentrification-vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim && git submodule init && git submodule update
