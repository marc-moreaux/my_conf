


# Some installs 
sudo apt-get install guake
sudo apt-get install -f
sudo apt-get install guake
sudo apt-get install tmux
sudo apt-get install vim
sudo apt-get install git


# Install oh-my-zsh
sudo apt-get install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo apt-get install fonts-powerline
chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# in .zshrc :
# set theme to agnoster
# add zsh-autosuggestions in plugins
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6' in user conf
# Install solarized theme...

# Google chrome
# First download it @ www.google.com/chrome
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f


# Install python things
sudo apt-get install build-essential gfortran libatlas-base-dev 
sudo apt-get install python-pip python-dev libfreetype6-dev libffi-dev 
sudo pip install -U pip
sudo pip install numpy
sudo pip install pandas
sudo pip install pipenv


