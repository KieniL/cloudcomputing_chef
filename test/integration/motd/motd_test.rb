# InSpec test for recipe cloudcomputing::motd

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

# describe file('/etc/motd') do
#  its(:content) { should match(/Property of DevOpsDC/) }
#end

describe file('/etc/motd') do
  it { should exist }
  its('content') { should match(%r{GCloud}) }
  its('content') { should match(%r{(\w*,\w+)*}) }
  its('content') { should match(%r{KAPPEL/Christoph}) }
  its('content') { should match(%r{^\s*(3[01]|[12][0-9]|0?[1-9])\.(1[012]|0?[1-9])\.((?:19|20)\d{2})\s*$}) }
  its('content') { should match(%r{Changed}) }
end
