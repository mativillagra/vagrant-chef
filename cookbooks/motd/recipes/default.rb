#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file "#{ENV['HOME']}/motd.txt" do
     content 'Written in stone__'
end
