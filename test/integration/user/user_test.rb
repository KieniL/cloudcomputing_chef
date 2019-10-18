# InSpec test for recipe cloudcomputing::user

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

#Test User ckappel
describe user('ckappel') do
  it { should exist }
  its('groups') { should eq ['ckappel', 'sudo']}
  its('home') { should eq '/home/kappelc' }
  its('shell') { should eq '/bin/bash' }
end

#Test User animmervoll
describe user('animmervoll') do
  it { should exist }
  its('groups') { should eq ['animmervoll', 'lecturer']}
  its('home') { should eq '/home/nimm' }
  its('shell') { should eq '/bin/zsh' }
end

#Test Allowed SSH Users
describe file('/etc/ssh/sshd_config') do
  its('content') { should match(%r{.*?AllowUsers ckappel animmervoll}) }
end
