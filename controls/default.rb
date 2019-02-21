title 'Uptime'

describe file('/proc/uptime') do
  it { should exist }
end

describe command("awk '{print $1}' /proc/uptime") do
  its('stdout') { should cmp > '3600' }
end
