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
  autoload :Reader
  autoload :Caster
  autoload :DbReader
  autoload :ActiveRecordHelpers
  autoload :Constants
  autoload :DbSyncer

  module Builders
    extend ActiveSupport::Autoload

    autoload :Group
    autoload :GroupedSetting
    autoload :Setting
  end

  module Configs
    extend ActiveSupport::Autoload

    autoload :Main
    autoload :Localization
  end

  module Data
    extend ActiveSupport::Autoload
    
    autoload :Group
    autoload :Setting
  end

  module DSL
    extend ActiveSupport::Autoload

    autoload :TopLevel
    autoload :Group
  end

  module Persistence
    extend ActiveSupport::Autoload

    autoload :Repo
  end

  module Repos
    extend ActiveSupport::Autoload

    autoload :Settings
    autoload :Groups
  end

  module Caching
    extend ActiveSupport::Autoload

    autoload :Store
    autoload :PersistenceRepoExtension
  end

  include Constants

  # Provides an ability to configure Settingify
  #
  # @yield [Settingify::Configs::Main] A main config object
  # @return [Settingify::Configs::Main] A main config object
  def self.config(&_block)
    @_main_config ||= Configs::Main.new
    block_given? ? yield(@_main_config) : @_main_config
  end

  # Provides a list of all defined settings
  #
  # @return [Array<Settingify::Data::Setting>]
  def self.registered_settings
    Repos::Settings.instance.list
  end

  # Provides a list of all defined groups
  #
  # @return [Array<Settingify::Data::Group>]
  def self.groups
    Repos::Groups.instance.all
  end

  # The main API point to define new settings and groups of them
  #
  # @yield [Settingify::DSL::TopLevel] - An object which provides a top level DSL for defining
  #   settings
  def self.prepare_settings(&block)
    raise Settingify::PrepareSettingsWithoutBlockError, 'Block must be passed!' unless block_given?
    DSL::TopLevel.new.instance_eval(&block)
  end

  # Clear a related cache entries
  def self.clear_cache
    return unless config.cache_enabled?
    config.cache_store.clear
  end
end
