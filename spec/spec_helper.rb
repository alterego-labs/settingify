$TESTING=true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'active_record'
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
load 'db/schema.rb'

require 'rspec/its'
require 'generator_spec'
require 'settingify'
require 'pry-nav'

if ENV['TRAVIS'] == true
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.run_all_when_everything_filtered = true

  config.order = "random"
end

