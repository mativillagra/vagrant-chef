#
# Cookbook Name:: logrotate
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node['lsb']['description']

when /^Linux Mint 13/
	  # do nothing

when /^Ubuntu 12.04/
	   include_recipe "logrotate::configuration"

when /^Ubuntu 14.04/
	  # include the other recipes in this cookbook in order
	  # include_recipe "logrotate::configuration"
else
  	raise Exception.new("Unsupported OS")

end


template "/etc/logrotate.d/logrotate.conf" do
  source "logrotate.conf.erb"
  variables(
    how_often: "daily",
    keep: "31"
  )
end
