require "rubygems"
require 'rspec/core/rake_task'
require 'rubygems/specification'

desc "Run specs"
task :spec do
  RSpec::Core::RakeTask.new do |t|
    t.pattern = FileList['spec/lib/**/*_spec.rb']
    t.rspec_opts = %w(--colour)
  end
  RSpec::Core::RakeTask.new do |t|
    t.pattern = FileList['spec/localized_settingify_spec.rb']
    t.rspec_opts = %w(--colour)
  end
end
