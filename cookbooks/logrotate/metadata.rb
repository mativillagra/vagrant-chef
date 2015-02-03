name             'logrotate'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures logrotate'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "logrotate", "evalute node to perform installation"
recipe "logrotate::configuration", "install and configure the logrotate file"