#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Install a Webserver, configure it to start at system boot, start it immediately after install
# Provide customer index.html file from templates/default/index.html.erb
# http://training.enstratius.com/guides/load-balanced-deployment/create-apache-cookbook
# https://docs.chef.io/resource_package.html

case node.platform

when "redhat", "centos"

    package "httpd"
	
	template "/var/www/html/index.html" do
    	source "index.html.erb"
    	mode "0644"
	end

	service "httpd" do
		action [:enable,:start]
	end

	execute "iptables -I INPUT -p tcp --dport 80 -j ACCEPT"
	execute "/etc/init.d/iptables save"

when "ubuntu","debian"                                      
    
    package "apache2"
	
	template "/var/www/index.html" do
    	source "index.html.erb"
    	mode "0644"
	end

	service "apache2" do
		action [:enable,:start]
	end

	execute "iptables -I INPUT -p tcp --dport 80 -j ACCEPT"

else

  Chef::Log.info("*** I am not yet #{node.platform} compatible, sorry.")
  exit 1;

end


