#
# Cookbook:: cloudcomputing
# Recipe:: user
#
# Copyright:: 2019, The Authors, All Rights Reserved.

#Create User ckappel with bash shell and homedirectory
user 'ckappel' do
  shell '/bin/bash'
  home '/home/kappelc'
end

#Added ckappel to sudo group
group 'sudo' do
  members 'ckappel'
end

#Create animmervoll user with zsh shell and homedirectory
user 'animmervoll' do
  shell '/bin/zsh'
  home '/home/nimm'
end

#Add animmervoll to lecturer
group 'lecturer' do
  members 'animmervoll'
end

#Add ckappel and animmervoll to allowed ssh users (vagrant or the user defined in the kitchen.yml should also be allowed)
ruby_block "insert_line_to_sshd" do
    block do
        file = Chef::Util::FileEdit.new("/etc/ssh/sshd_config")
        file.insert_line_if_no_match("/AllowUsers ckappel animmervoll vagrant/", "AllowUsers ckappel animmervoll vagrant")
        file.write_file
    end
end


#Restart ssh
service 'ssh' do
  action :restart
end