#
# Cookbook Name:: atri
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

message = node['atri']['message']
Chef::Log.info("** Saying what I was told to say: #{message}")
