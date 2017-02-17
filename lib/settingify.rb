require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require "settingify/version"

require 'settingify/railtie' if defined?(Rails)
require 'settingify/errors'

require 'traco'

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

  module Builders
    extend ActiveSupport::Autoload

    autoload :Group
  end

  module Data
    extend ActiveSupport::Autoload
    
    autoload :Group
  end

  module Repos
    extend ActiveSupport::Autoload

    autoload :Settings
  end

  module Configs
    extend ActiveSupport::Autoload

    autoload :Main
    autoload :Localization
  end

  extend SettingsPreparable

  include Constants

  def self.config(&block)
    @_main_config ||= Configs::Main.new
    block_given? ? yield(@_main_config) : @_main_config
  end

  def self.registered_settings
    Repos::Settings.instance.list
  end

  def self.groups
    @_groups ||= []
  end
end
