directory(node[:example][:app_root])


web_app(node[:example][:app_name]) do
  server_name(node[:example][:server_name])
  docroot(node[:example][:app_root])
  template('vhost.conf.erb')
end
