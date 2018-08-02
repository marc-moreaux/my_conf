
mkdir -p /tmp/installs


# Some installs 
sudo apt-get install guake
sudo apt-get install -f
sudo apt-get install guake tmux vim git


# VIM things
sudo apt-get install dh-autoreconf
cd /tmp/installs
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure
make
sudo make install
cd ..
rm -rf ctags

echo '********************'
echo '> clone repository'
echo '********************'i
read -p "Enter your email address :" email
ssh-keygen -t rsa -b 4096 -C $email 
cd ~/
git clone https://github.com/marc-moreaux/my_conf.git 
rm .bashrc .vimrc .zshrc
ln -s my_conf/.bashrc ~/.bashrc
ln -s my_conf/.zshrc ~/.zshrc
ln -s my_conf/.vimrc ~/.vimrc


echo '********************'
echo '> Install chrome'
echo '********************'
cd /tmp/installs
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd ~/


echo '********************'
echo '> Install python things'
echo '********************'
sudo apt-get install build-essential gfortran libatlas-base-dev python-pip python-dev libfreetype6-dev libffi-dev libcupti-dev
sudo pip install -U pip
sudo pip install numpy
sudo pip install pandas
sudo pip install pipenv


echo '********************'
echo '> Install CUDA'
echo '********************'
# https://www.nvidia.com/en-us/data-center/gpu-accelerated-applications/tensorflow/
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt-get install nvidia-396
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
# cudnn needs hand DL :/
# https://developer.nvidia.com/rdp/cudnn-download
cd ~/Downloads
tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
rm cudnn-9.0-linux-x64-v7.1.tgz
rm -rf cuda



echo '********************'
echo '> Install zsh'
echo '********************'
sudo apt-get install zsh
sudo pip install powerline-status
sudo apt-get install fonts-powerline
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# in .zshrc :
# set theme to agnoster
# add zsh-autosuggestions in plugins
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6' in user conf
# Install solarized theme...


