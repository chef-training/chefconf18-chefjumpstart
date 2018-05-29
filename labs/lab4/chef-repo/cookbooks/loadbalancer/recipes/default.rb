#
# Cookbook:: loadbalancer
# Recipe:: default
#
# Copyright:: 2018, Chef, MIT License.


# Install haproxy from system packages
haproxy_install 'package'

# Use all the defaults from the haproxy cookbook
haproxy_config_global ''
haproxy_config_defaults ''


# Use search to fetch all the nodes with the webrole
webservers = []
webnodes = search('node','role:web')

# Loop through them, each_with_index returns each node object(webnode) and an incrementing integer (index)
# See https://ruby-doc.org/core-2.5.1/Enumerator.html
# For each node we construct the haproxy server entry using string interpolation, with the index giving the unique server key
webnodes.each_with_index do |webnode, index|
  servers.push("server#{index} #{webnode['cloud']['public_ipv4']}:80 maxconn 32")
end

# Create the backend, using the constructed array above for the server list.
haproxy_backend 'servers' do
  server servers
  notifies :restart, 'haproxy_service[haproxy]', :immediately
end

# Create a basic frontend, and attach it to the 'servers' backend
haproxy_frontend 'http-in' do
  default_backend 'servers'
end

# Finally start the service
haproxy_service 'haproxy'
