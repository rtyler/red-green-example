require 'rubygems'
require 'blimpy/cucumber'
require 'fileutils'

Before do
  # This is some hacky mess because I realized too late that blimpy-cucumber
  # doesn't properly link up modules

  # We should be in tmp/cucumber at this point
  FileUtils.ln_s(File.expand_path(Dir.pwd + '/../../modules'), work_dir)
end
