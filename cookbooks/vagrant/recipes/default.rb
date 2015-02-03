#
# Cookbook Name:: vagrant
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#https://github.com/engineyard/ey-cloud-recipes/blob/master/cookbooks/jenkins/recipes/jenkins_install.rb
#https://docs.chef.io/resource_remote_file.html || https://docs.chef.io/resource_package.html
#package 'sqldeveloper.deb' do
#provider Chef::Provider::Package::Dpkg
#source "/var/tmp/sqldeveloper.deb"
#action :install
#end



case node.platform

when "redhat", "centos"

  if node['kernel']['machine'] == 'x86_64'

  	provider Chef::Provider::Package::Rpm
  	source node[:vagrant][:package][:url]
  	action :install
  else
  	provider Chef::Provider::Package::Rpm
  	source node[:vagrant][:package][:url]
	action :install 
  end 

when "ubuntu","debian"

  if node['kernel']['machine'] == 'x86_64'                                 
    
    	provider Chef::Provider::Package::Dpkg
        source node[:vagrant][:package][:url]
  	action :install
  else 

        remote_file "/home/vagrant/Downloads/vagrant_1.7.2_i686.deb" do
        source node[:vagrant][:package][:url]
        action :create_if_missing 	
        end
  end

else

  Chef::Log.info("*** I am not yet #{node.platform} compatible, sorry.")
  exit 1;

end
