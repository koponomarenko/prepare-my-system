#!/bin/bash

sudo port selfupdate
sudo port upgrade outdated
sudo port clean --all installed
sudo port -f uninstall inactive


# port search --name --line --glob '*pip*'
# port reclaim                  - uninstalling inactive ports, and removing unnecessary files

# port variants <port-name>     - check what variations of a port are available before you install it
# sudo port install <port-name> - installs a port
# port deps <port-name>         - lists the dependencies of a port


# port installed                - lists all installed ports
# port outdated	                - shows is any ports should be updated
# sudo port upgrade outdated    - upgrades installed ports and their dependencies


# port dependents <port-name>   - shows what ports depend upon a given port
# port contents <port-name>     - displays a list of all files that have been installed by a given port
# sudo port uninstall <port-name> - removes an installed port
# sudo port clean <port-name>   - deletes intermediate files created by MacPorts while installing a port
