#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"

package "git" do
   version "1:1.7.9.5-1"
   action :install
end
