#
# Cookbook Name:: logrotate
# Recipe:: configuration
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/logrotate.d/logrotate.conf" do
  source "logrotate.conf.erb"
  variables(
    how_often: "daily",
    keep: "31"
  )
  action :create_if_missing 
end
