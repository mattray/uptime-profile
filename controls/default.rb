control 'Uptime exists' do
  title '/proc/uptime exists'
  desc "
Can't check uptime without the uptime file
  "
  impact 1.0
  tag 'uptime', 'proc'
  describe file('/proc/uptime') do
    it { should exist }
  end
end

control 'Up for an hour' do
  title '> 3600 seconds '
  desc "
Check that the machine has been up for an hour.
  "
  impact 1.0
  tag 'uptime'
  describe command("awk '{print $1}' /proc/uptime") do
    its('stdout') { should cmp > '3600' }
  end
end
