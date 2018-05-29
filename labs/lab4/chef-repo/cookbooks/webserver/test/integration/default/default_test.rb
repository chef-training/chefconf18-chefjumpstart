# # encoding: utf-8

# Inspec test for recipe lab2::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe port(80)  do
  it { should be_listening }
end

describe http('http://localhost',enable_remote_worker: true) do
  its('status') { should cmp 200 }
  its('body') { should match /Hello World/ } 
  its('body') { should match /Local IP Address: \d+\.\d+\.\d+\.\d+/ } 
end
