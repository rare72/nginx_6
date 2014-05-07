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
file{'/etc/nginx/nginx.conf':
   ensure => file,
   mode   => 0755,
   owner  => "root",
   group  => "root",
   source => "/home/data/modules/nginx_6/files/nginx.conf"
  }

# 2b. myconfig_2b /etc/nginx/sites-available/default
file{'/etc/nginx/sites-available/default':
   ensure => file,
   mode   => 0755,
   owner  => "root",
   group  => "root",
   source => "/home/data/modules/nginx_6/files/default"
  }

# 2c. myconfig_2c /etc/nginx/conf.d/puptest.conf 
#file{'/etc/nginx/conf.d/puptest.conf':
#   ensure => file,
#   mode   => 0755,
#   owner  => "root",
#   group  => "root",
#   source => "/home/data/modules/nginx_6/files/puptest.conf"
#  }

# 3. Copy webpage using wget from puppetlabs GIT-Repo then source the file to the proper location
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
