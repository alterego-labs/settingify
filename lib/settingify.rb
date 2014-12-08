require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require "settingify/version"

module Settingify
  extend ActiveSupport::Autoload

  autoload :Setting
  autoload :SettingBuilder
  autoload :SettingsList

  extend SettingBuilder
  extend SettingsList

  def self.prepare_settings(&block)
    raise 'Block must be passed!' unless block_given?
    instance_eval(&block)
  end
end
