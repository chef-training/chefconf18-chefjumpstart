#
# Cookbook:: lab2
# Recipe:: default
#
# Copyright:: 2018, Chef, MIT License.


package 'httpd'

file '/var/www/html/index.html' do
  content '<h1>Hello World!</h1>'
end

service 'httpd' do
  action [:enable, :start]
end

