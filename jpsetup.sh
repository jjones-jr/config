#!/bin/bash

#Japanese support

sudo apt-get install fonts-takao* locales im-config ibus ibus-mozc ibus-qt4 ibus-gtk ibus-gtk3 ibus-clutter iceweasel-l10n-ja acroread-fonts-jpn -y
sudo dpkg-reconfigure locales && im-config && ibus-setup

