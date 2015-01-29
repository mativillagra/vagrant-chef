default[:example][:app_name] = 'example'
default[:example][:server_name] = 'example.yourdomain.com'
default[:example][:app_root] = "/var/www/#{node[:example][:app_name]}"
