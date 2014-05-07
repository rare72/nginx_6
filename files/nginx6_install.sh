#!/bin/bash

##
# Make the Needed Directories
##
mkdir -m 755 -pv /home/data/modules/
cd /home/data/modules/
##
# Clone the Git Repo. for local use
##
git clone https://github.com/rare72/nginx_6.git
##
# Apply permission to the repository file (Who knows how you will apply these files to the system)
##
chmod 755 -Rv /home/data/modules
##
# Run the Puppet created module
##
puppet apply --verbose /home/data/modules/nginx_6/manifests/site.pp
