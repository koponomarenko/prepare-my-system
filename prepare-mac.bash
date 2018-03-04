#!/bin/bash

#TODO: ensure that the script is not started with 'sudo'

cp vimrc $HOME/.vimrc
cp update-ports.bash $HOME/.


echo "MacPorts need some tools..."
echo
echo 'Did you install "Xcode"?'
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
echo
echo 'Did you install "Apple Command Line Developer Tools"?'
echo 'They can be installed with "xcode-select --install"'
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
echo
echo 'Did you install MacPorts pkg?'
echo 'You can get it from: https://www.macports.org/install.php'
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
echo

set_up_bash_completion()
{
    echo 'set_up_bash_completion'
    sudo port install bash-completion

    # Look for what is the current default file for bash.
    local bash_profile=''
    if [ -e "$HOME/.profile" ]; then
        bash_profile=$HOME/.profile
    else
        bash_profile=$HOME/.bash_profile
    fi

    # Add the completion script to the bash profile.
    grep -q 'bash-completion' $bash_profile || cat << EOF >>$bash_profile
# bash-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi
# bash-completion for 'sudo'
complete -cf sudo
EOF

    # Install '+bash_completion' variant automatically with a port if available.
    local variants_file=/opt/local/etc/macports/variants.conf
    grep -q 'bash_completion' $variants_file || sudo bash -c "echo '+bash_completion' >> $variants_file"

    # Ensure that bash from MacPorts is used in the Terminal.app.
    # See here for HOW TO: https://trac.macports.org/wiki/howto/bash-completion
cat << EOF

IMPORTANT, don't forget to do this.
You need to change the command Terminal.app uses to launch the shell in the preferences.

1. Menu > Preferences > General > "Shells open with:"
2. Select "Command" and enter "/opt/local/bin/bash -l" to switch to bash provided by MacPorts.
3. Menu > Preferences > Profiles > Shell > "Ask before closing:"
4. Click "+" and add "bash" to the list of processes (in newer versions of OS X use "-bash").
5. Close and reopen any terminal windows

EOF

    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n' # from the Internet =)
}

set_up_bash_completion

exit 0


sudo port install python36
sudo port install py36-pip
sudo port select --set pip pip36
sudo pip install meson # may be done with 'port' as well
sudo port install ninja
sudo port install git

# echo tips
cat <<EOF
Don't forget to:
    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"
EOF
