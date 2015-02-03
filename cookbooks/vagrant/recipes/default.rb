#
# Cookbook Name:: vagrant
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node.platform

when "redhat", "centos"

  if node['kernel']['machine'] == 'x86_64'

  	provider Chef::Provider::Package::Rpm
  	source ['vagrant']['package']['url']
  	action :install
  else
  	provider Chef::Provider::Package::Rpm
  	source ['vagrant']['package']['url']
	action :install 
  end 

when "ubuntu","debian"

  if node['kernel']['machine'] == 'x86_64'                                 
    
    	provider Chef::Provider::Package::Dpkg
    	source node['vagrant']['package']['url']
  	action :install
  else
  	provider Chef::Provider::Package::Rpm
  	source ['vagrant']['package']['url']
  	action :install
  end

else

  Chef::Log.info("*** I am not yet #{node.platform} compatible, sorry.")
  exit 1;

end
