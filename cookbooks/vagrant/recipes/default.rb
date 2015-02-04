#
# Cookbook Name:: vagrant
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#https://docs.chef.io/resource_remote_file.html || https://docs.chef.io/resource_package.html
#http://misheska.com/blog/2014/11/25/chef-server-12/
#http://ruby-doc.org/core-1.9.3/File.html
"#{Chef::Config[:file_cache_path]}/#{package_name}" /var/chef/cache


package_url = node['vagrant']['url'] 
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"


#package is remote, let's download it
remote_file package_local_path do
  source package_url
end


package package_name do
source package_local_path
	provider case node['platform_family']
		
		when 'rhel', 'centos'
			
			if node['kernel']['machine'] == 'x86_64'   
				Chef::Provider::Package::Rpm
			else
				Chef::Provider::Package::Rpm
			end

		when 'ubuntu','debian'
			
			if node['kernel']['machine'] == 'x86_64'   
				Chef::Provider::Package::Dpkg
			else
				Chef::Provider::Package::Dpkg
			end 

		end
end

