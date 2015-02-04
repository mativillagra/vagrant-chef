case node['platform_family']

when 'rhel', 'centos'
  
  if node['kernel']['machine'] == 'x86_64'
    
    default['vagrant']['package']['url'] = 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.rpm'
    
  else
    
    default['vagrant']['package']['url'] = 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_i686.rpm'

  
  end

when 'ubuntu','debian' 


  if node['kernel']['machine'] == 'x86_64'

   default['vagrant']['package']['url'] = 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb'
  
  else

    default['vagrant']['url'] = \
    'https://dl.bintray.com/mitchellh/vagrant/'\
    'vagrant_1.7.2_i686.deb'

  end

end
