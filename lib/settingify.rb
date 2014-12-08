require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require "settingify/version"

module Settingify
  extend ActiveSupport::Autoload

  autoload :Setting
  autoload :SettingBuilder
  autoload :SettingsList
  autoload :Reader

  extend SettingBuilder
  extend SettingsList

  refine Integer do
    def self.try_convert(value)
      Integer(value)
    end
  end

  def self.prepare_settings(&block)
    raise 'Block must be passed!' unless block_given?
    instance_eval(&block)
  end
end
