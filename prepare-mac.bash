#!/bin/bash

#TODO: ensure that the script is not started with 'sudo'

cp vimrc /Users/$USER/.vimrc

exit 0

# TODO: need to check those steps again.

# install xCode
# Install Apple's Command Line Developer Tools
xcode-select --install
# install 'port' (macports)

set_up_bash_completion()
{
    # Set up bash completion for 'port'
    sudo port install bash-completion
    if [ -e "/Users/$USER/.profile" ]; then
        bash_profile=/Users/$USER/.profile
    else
        bash_profile=/Users/$USER/.bash_profile
    fi

    if 

    #TODO: check if these lines are already in the file
    cat << EOF >>$bash_profile
# bash-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi
EOF
}

set_up_bash_completion

# Install +bash_completion variant automatically with all ports.
#TODO: ensure it's not added if already there.
sudo bash -c 'echo "+bash_completion" >> /opt/local/etc/macports/variants.conf'

sudo port install python36
sudo port install py36-pip

sudo port select --set pip pip36
sudo pip install meson # may be done with 'port' as well

sudo port install meson
sudo port install ninja
sudo port install git

# echo tips
cat <<EOF
Don't forget to:
    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"
EOF
