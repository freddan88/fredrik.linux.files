#!/usr/bin/env bash

url_config_i3="https://raw.githubusercontent.com/freddan88/fredrik.linux.files/main/i3/configs/config_i3_minimal.txt"
url_config_i3_status="https://raw.githubusercontent.com/freddan88/fredrik.linux.files/main/i3/configs/config_i3_status.txt"

# Link to file on GitHub
# https://github.com/freddan88/fredrik.linux.files/blob/main/i3/006_update_i3_config_minimal.sh

################################
# DO NOT EDIT BELOW THIS LINE! #
################################

if [ "$SUDO_USER" ]; then
  echo " "
  echo "PLEASE DO NOT RUN THIS SCRIPT AS A SUDO-USER"
  echo " "
  exit
fi

echo " "
echo "UPDATING i3 CONFIG" && sleep 2
echo " "

rm -rf $HOME/.config/i3 && mkdir -p $HOME/.config/i3 && cd $HOME/.config/i3
wget -O config $url_config_i3 && wget -O config_i3_status $url_config_i3_status

mkdir -p $HOME/.config/i3/scripts && cd $HOME/.config/i3/scripts
wget https://raw.githubusercontent.com/freddan88/fredrik.linux.files/main/i3/scripts/i3keybindings.sh
chmod u+x i3keybindings.sh

mkdir -p $HOME/.config/i3/docs && cd $HOME/.config/i3/docs
wget https://raw.githubusercontent.com/freddan88/fredrik.linux.files/main/i3/downloads/i3keybindings.css

echo " "
echo "NEW i3 CONFIG-FILES IN $HOME/.config/i3" && sleep 2
echo " "

ls -al $HOME/.config/i3

# i3-msg restart 1>/dev/null
# i3-msg reload 1>/dev/null

echo " "
echo "DONE!"
echo " "
