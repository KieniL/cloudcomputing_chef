#
# Cookbook:: cloudcomputing
# Recipe:: user
#
# Copyright:: 2019, The Authors, All Rights Reserved.

user 'ckappel' do
  shell '/bin/bash'
  home '/home/kappelc'
end


group 'sudo' do
  members 'ckappel'
end

user 'animmervoll' do
  shell '/bin/zsh'
  home '/home/nimm'
end

group 'lecturer' do
  members 'animmervoll'
end

ruby_block "insert_line_to_sshd" do
    block do
        file = Chef::Util::FileEdit.new("/etc/ssh/sshd_config")
        file.insert_line_if_no_match("/AllowUsers ckappel animmervoll/", "AllowUsers ckappel animmervoll")
        file.write_file
    end
end
