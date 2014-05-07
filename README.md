nginx_6
=======


This module will install and setup Nginx. Nginx will operate on port 8080. This module operates by cloning the git repo the sourcing the files to the proper location.

- Install's Nginx package and all needed dependecies
- Properly sources "/etc/nginx/nginx.conf"
- Properly sources "/etc/nginx/sites-available/default"
- Properly sources "/etc/nginx/conf.d/puptest.conf"
- Properly sources static test webpage to the default directory "/usr/share/nginx/www/index.html"

Apply this module by issueing the following command:

- wget https://raw.githubusercontent.com/rare72/nginx_6/master/files/nginx6_install.sh -r -v -O /tmp/nginx6_install.sh;bash /tmp/nginx6_install.sh

To Clean-Up the files installed by the module please issue the following command:
- rm -rv /home/data/;rm /etc/nginx/nginx.conf;rm /etc/nginx/conf.d/puptest.conf;rm /etc/nginx/sites-available/default;rm /usr/share/nginx/www/index.html;service nginx stop;apt-get remove -y nginx
