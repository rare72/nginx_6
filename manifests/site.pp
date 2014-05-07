$timestamp = generate('/bin/date', '+%Y%m%d-%H%M')
file {"/tmp/pappy_nginx5_${timestamp}":
   content => "The Puppet NGINX_5 module was executed.",
   ensure => 'file',
 }

# 1. Ensure packages are installed
package {'nginx': 
   ensure => installed,
 }

# 2. Copy my configuration files via wget then source them to the proper location
# 2a. myconfig_2a /etc/nginx/nginx.conf
exec{'webconfig_2a':
   command => "/usr/bin/wget https://raw.githubusercontent.com/rare72/nginx_5/master/files/nginx.conf -r -v -O /etc/nginx/nginx.conf",
 }

file{'/etc/nginx/nginx.conf':
   ensure => file,
   mode   => 0755,
   owner  => "root",
   group  => "root",
   source => "puppet:///modules/module_name/sudoers"
 }

# 2b. myconfig_2b /etc/nginx/sites-available/default
exec{'webconfig_2b':
   command => "/usr/bin/wget https://raw.githubusercontent.com/rare72/nginx_5/master/files/default -r -v -O /etc/nginx/sites-available/default",
 }

file{'/etc/nginx/sites-available/default':
   mode   => 0755,
   owner  => "root",
   group  => "root",
   ensure => file,
 }

# 2c. myconfig_2c /etc/nginx/conf.d/puptest.conf 
exec{'webconfig_2c':
   command => "/usr/bin/wget https://raw.githubusercontent.com/rare72/nginx_5/master/files/puptest.conf -r -v -O /etc/nginx/conf.d/puptest.conf",
 }

file{'/etc/nginx/conf.d/puptest.conf':
   mode   => 0755,
   owner  => "root",
   group  => "root",
   ensure => file,
 }

# 3. Copy webpage using wget from GIT-Repo then source the file to the proper location
exec{'cp_webpage':
   command => "/usr/bin/wget https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html -r -v -O /usr/share/nginx/www/index.html",
 }

file{'/usr/share/nginx/www/index.html':
   mode => 0755,
   ensure => file,
   owner  => "root",
   group  => "root",
 }  

# 4. Ensure the NGINX daemon is running
service { 'nginx':   
   ensure => running,
   enable  => true,
   hasrestart => true,
   provider => "debian",
 }
