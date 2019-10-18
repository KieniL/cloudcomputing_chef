#
# Cookbook:: cloudcomputing
# Recipe:: nginx
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_update 'update'

package 'nginx' do
  action :install
end


service 'nginx' do
  action [ :enable, :start ]
end

# See https://medium.com/@pierangelo1982/a-basic-nginx-cookbook-for-chef-ba95d801dbf3 for this
cookbook_file "/var/www/html/index.html" do
  source "index.html"
  mode "0644"
end