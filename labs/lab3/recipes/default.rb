#
# Cookbook:: lab2
# Recipe:: default
#
# Copyright:: 2018, Chef, MIT License.


package 'httpd'

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

service 'httpd' do
  action [:enable, :start]
end

