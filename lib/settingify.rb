require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require "settingify/version"

require 'settingify/railtie' if defined?(Rails)
require 'settingify/errors'

module Settingify
  extend ActiveSupport::Autoload

  autoload :ContractExt
  autoload :Setting
  autoload :DSL
  autoload :Reader
  autoload :Caster
  autoload :DbReader
  autoload :ActiveRecordHelpers
  autoload :Constants
  autoload :Repo
  autoload :RepoItem
  autoload :DbSyncer
  autoload :SettingsPreparable
  autoload :Group

  module Builders
    extend ActiveSupport::Autoload

    autoload :Group
  end

  module Repos
    extend ActiveSupport::Autoload

    autoload :Settings
  end

  extend SettingsPreparable

  include Constants

  def self.registered_settings
    Repos::Settings.instance.list
  end

  def self.groups
    @_groups ||= []
  end
end
