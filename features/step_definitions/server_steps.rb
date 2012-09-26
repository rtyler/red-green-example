Given /^an empty host$/ do
  # Use part of the blimpy-cucumber API
  expect(vm('Linux')).to_not be_nil
end

Given /^the host is classified as a www node$/ do
  # Use some more blimpy-cucumber undocumented magic
  resources << """
include apache
"""
end

Then /^it should be running a web server$/ do
  running = vm.ssh_into('pgrep apache2')
  running.should be_true
end

Then /^it should be responding to web requests$/ do
  responding = vm.ssh_into('curl -s http://localhost -o /dev/null')
  responding.should be_true
end
