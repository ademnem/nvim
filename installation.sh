sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..
rm -rf neovim
