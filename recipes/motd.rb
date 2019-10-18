#
# Cookbook:: cloudcomputing
# Recipe:: motd
#
# Copyright:: 2019, The Authors, All Rights Reserved.

template '/etc/motd' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(groupname: node['motd']['groupname'],
            groupmembers: node['motd']['groupmembers'],
			lecturer: node['motd']['lecturer'],
			#lastRun: node['authorization']['sudo']['users'],
			changeText: node['motd']['changeText'])
end