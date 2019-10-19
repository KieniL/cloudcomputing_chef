# InSpec test for recipe cloudcomputing::nginx

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('nginx') do
  it { should be_installed }
end


describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/www/html/index.html') do
  its('content') { should match(%r{AUERBECK Peter, KIENAST Lukas, OPPENAUER Clemens}) }
end


