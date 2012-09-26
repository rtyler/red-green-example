require 'rake'

require 'puppet-lint/tasks/puppet-lint'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber)

spec_tasks = []
namespace :spec do
  namespace :modules do
    Dir.glob('modules/*') do |p|
      if File.directory?(File.join(p, 'spec'))
        name = File.basename(p)
        spec_tasks << "spec:modules:#{name}"
        desc "Run rspec-puppet tests for the #{name} module"
        task name.to_sym do |t|
          sh "cd #{p} && rspec --color --fail-fast"
        end
      end
    end
  end
end

desc "Run all rspec-puppet module tasks"
task :spec => spec_tasks


desc "Run all rspec and then cucumber tasks"
task :test => spec_tasks + [:cucumber]
