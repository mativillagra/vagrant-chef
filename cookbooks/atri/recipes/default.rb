#
# Cookbook Name:: atri
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# http://docs.chef.io/attributes.html

file "/tmp/info" do 
	content 'Hello World!' 
	owner 'root'
	group 'root'
	mode 644
end 

template '/tmp/message' do
	source 'message.erb'
	variables(
	hi: 'Hallo',
	world: 'Welt',
	from: node['fqdn']
	)
end

message = node['atri']['message']
Chef::Log.info("** Saying what I was told to say: #{message}")
