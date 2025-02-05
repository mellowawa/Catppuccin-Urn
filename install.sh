#!/usr/bin/bash
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "╭─────────────────────────────────────────────────────────────────────────╮"
  echo "│   Usage: ./install.sh --variant                                         │"
  echo "├─────────────────────────────────────────────────────────────────────────┤"
  echo "│          --mocha: selects the Mocha theme variant                       │"
  echo "│       --mocha-wr: selects the Mocha theme variant with WR support       │"
  echo "│      --macchiato: selects the Macchiato theme variant                   │"
  echo "│   --macchiato-wr: selects the Macchiato theme variant with WR support   │"
  echo "│         --frappe: selects the Frappe theme variant                      │"
  echo "│      --frappe-wr: selects the Frappe theme variant with WR support      │"
  echo "│          --latte: selects the Latte theme variant                       │"
  echo "│       --latte-wr: selects the Frappe theme variant with WR support      │"
  echo "│                                                                         │"
  echo "│            --all: installs every theme (set theme before running Urn)   │"
  echo "├─────────────────────────────────────────────────────────────────────────┤"
  echo "│            --set: set Urn's theme from already installed themes         │"
  echo "├─────────────────────────────────────────────────────────────────────────┤"
  echo "│      --help | -h: displays this help dialog than exits                  │"
  echo "╰─────────────────────────────────────────────────────────────────────────╯"
  exit
fi

if [ "$1" == "--mocha" ]; then
  theme="mocha"
elif [ "$1" == "--mocha-wr" ]; then
  theme="mocha-wr"

elif [ "$1" == "--macchiato" ]; then
  theme="macchiato"
elif [ "$1" == "--macchiato-wr" ]; then
  theme="macchiato-wr"

elif [ "$1" == "--frappe" ]; then
  theme="frappe"
elif [ "$1" == "--frappe-wr" ]; then
  theme="frappe-wr"

elif [ "$1" == "--latte" ]; then
  theme="latte"
elif [ "$1" == "--late-wr" ]; then
  theme="latte-wr"

elif [ "$1" == "" ]; then
  ./install.sh -h 2<&1 && echo ""
  exit 0
fi

if [ "$1" == "--all" ]; then
  echo "Selected: All"
else
echo "Selected: $theme "
fi
echo ""
sleep 0.5

echo "To continue Sudo access will be required"
echo "Do NOT continue if you do not know what this script is doing"

read -p "Do you want to continue? (y/n): " confirmation
if [[ "$confirmation" == [Yy] ]]; then
  echo "Continuing....."
  sleep 0.5
else
  echo "Aborted."
  exit 1
fi

if [ "$1" == "--all" ]; then
  sudo -k cp -r mocha mocha-wr macchiato macchiato-wr frappe frappe-wr latte latte-wr /usr/local/share/urn/themes/

  echo ""
  ls /usr/local/share/urn/themes | while IFS= read -r line; do echo -e "\033[1;34m$line\033[0m"; done

  read -p "Which Theme do you want to use? " selectTheme

  validThemes=("mocha" "mocha-wr" "macchiato" "macchiato-wr" "frappe" "frappe-wr" "latte" "latte-wr")

  if [[ ! " ${validThemes[@]} " =~ " ${selectTheme} " ]]; then
    echo "Invalid theme selected. Exiting....."
    exit 1
  else
    gsettings set wildmouse.urn theme $selectTheme
    echo "Set theme to: $selectTheme"
    echo ""
    echo "You can change the theme by running: gsettings set wildmouse.urn theme <theme>"
    exit 0
  fi
else
  sudo cp -r $theme /usr/local/share/urn/themes/
  gsettings set wildmouse.urn theme $theme
  exit 0
fi


if [ "$2" == "--set" ]; then
  ls /usr/local/share/urn/themes | while IFS= read -r line; do echo -e "\033[1;34m$line\033[0m"; done
  read -p "Which Theme do you want to use? " selectTheme

  if [[ ! " ${validThemes[@]} " =~ " ${selectTheme} " ]]; then
    echo "Invalid theme selected. Exiting....."
    exit 1
  else
    gsettings set wildmouse.urn theme $selectTheme
    echo "Set theme to: $selectTheme"
    echo ""
    echo "You can change the theme by running: gsettings set wildmouse.urn theme <theme>"
    exit 0
  fi
fi







