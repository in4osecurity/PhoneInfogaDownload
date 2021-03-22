#!/bin/bash

# Bash installation script for UNIX systems only
# Use it : curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install | bash
apt install toilet lolcat
toilet -f mono12 -F border BLACK HAT | lolcat
os="$(uname -s)_$(uname -m)"
echo "Подпишись на наш Telegram канал ~> t.me/blackhat_lab"

if [ $os == "Linux_x86_64" ] || [ $os == "Linux_armv6" ] || [ $os == "Darwin_x86_64" ] || [ $os == "Linux_arm64" ] || [ $os == "Linux_i386" ]; then
  echo "Installing PhoneInfoga"
  phoneinfoga_version=$(curl -s https://api.github.com/repos/sundowndev/PhoneInfoga/releases/latest | grep tag_name | cut -d '"' -f 4)
  echo "Found version $phoneinfoga_version"

  echo "Downloading version $phoneinfoga_version..."
  wget "https://github.com/sundowndev/phoneinfoga/releases/download/$phoneinfoga_version/PhoneInfoga_$os.tar.gz"

  echo "Verifying checksum..."
  curl -sSL https://github.com/sundowndev/PhoneInfoga/releases/download/$phoneinfoga_version/PhoneInfoga_checksums.txt | sha256sum -c --strict --ignore-missing
  [ $? -eq 0 ] || exit 1

  tar xfv "PhoneInfoga_$os.tar.gz"
  rm PhoneInfoga_$os.tar.gz

  echo "Installation completed successfully."
  echo "Подпишись на @blackhat_lab!"
else
  echo "Your OS/Arch is not supported."
  exit 1
fi

exit 0

