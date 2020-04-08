# How to Update

Don't git clone because its missing :PlugInstall

Instead copy from linstore

rsync -vaP --delete linstore:/store/data/manup/nwq/vimrc/source/vimrc-current/etc/vim/ ./vim
find ./vim -type d -name '.git' -exec rm -rf {} \;
