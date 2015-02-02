#
# Cookbook Name:: ghost
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#Please read 
#http://stackoverflow.com/questions/8530593/chef-install-and-update-programs-from-source
#https://docs.chef.io/resource_remote_file.html
#http://reiddraper.com/first-chef-recipe/
#https://coderwall.com/p/xpz5ow/using-chef-s-remote_file-with-github-raw-content

package "build-essential" do
  action :install
end

directory node[:ghost][:dir] do
  owner node[:ghost][:user]
  mode "0755"
  action :create
end

directory node[:ghost][:logs] do
  owner node[:ghost][:user]
  mode "0755"
  action :create
end

template "message" do
  path "#{node[:ghost][:logs]}/message"
  source "ghost.erb"
  owner node[:ghost][:user]
  group node[:ghost][:user]
  mode "0644"
end

remote_file "#{node[:ghost][:dir]}/GHOST.c" do
  source "https://webshare.uchicago.edu/orgs/ITServices/itsec/Downloads/GHOST.c"
  notifies :run, "bash[run_program]", :immediately
end

bash "run_program" do
  user node[:ghost][:user]
  cwd  node[:ghost][:dir]
  code <<-EOH
     gcc -o GHOST GHOST.c
  EOH
end
