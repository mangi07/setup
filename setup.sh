# If root on docker container:
# Create user:
#   adduser ben
#   sudo usermod -aG sudo ben
# cp this folder to user's home folder and ...
# chown of this folder to ben user:
#   sudo chown ben ./setup/


sudo apt update
sudo apt upgrade

sudo apt install git
sudo apt install curl
sudo apt install tree
sudo apt install htop
sudo apt install tmux

cp tmux/.tmux.conf.orig ~/.tmux.conf

# python stuff
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9
sudo apt install python3-pip
sudo apt install python3.9-venv
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 # to make python3.9 the default executable of 'python3'
pip3 install --upgrade pynvim


# node stuff
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
# yarn package manager
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
     echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn

# nvim stuff
sudo add-apt-repository ppa:neovim-ppa/unstable # needed to get neovim 0.5
sudo apt-get update
sudo apt-get install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo chown -R $(whoami) /usr/lib/node_modules/
npm install -g neovim
npm install -g pyright
npm install -g typescript typescript-language-server
npm i -g vscode-langservers-extracted # html, css, and json from vscode (vscode-html-language-server, vscode-css-language-server and vscode-json-language-server for the $PATH)
