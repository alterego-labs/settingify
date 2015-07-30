require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require "settingify/version"

require 'settingify/railtie' if defined?(Rails)

module Settingify
  extend ActiveSupport::Autoload

  autoload :ContractExt
  autoload :Setting
  autoload :SettingBuilder
  autoload :SettingsList
  autoload :Reader
  autoload :Caster
  autoload :DbReader
  autoload :ActiveRecordHelpers
  autoload :Constants
  autoload :Repo
  autoload :DbSyncer

  extend SettingBuilder
  extend SettingsList

  include Constants

  def self.prepare_settings(&block)
    raise 'Block must be passed!' unless block_given?
    instance_eval(&block)
  end

  def self.registered_settings
    Repo.instance.list
  end
end
