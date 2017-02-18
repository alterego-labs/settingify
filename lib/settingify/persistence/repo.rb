require 'singleton'

module Settingify
  module Persistence
    # A repository object for persistence data source of settings
    class Repo
      include Singleton
      
      # Returns a first setting which has a specified key or new setting with a default value
      #
      # @param key [Symbol, String] A key of needed setting
      # @param default_value [String] A default value if there is no settings with a needed key
      # @return [Settingify::Setting]
      def first_or_default(key, default_value)
        get_by_keys(key).first_or_initialize(value: default_value)
      end

      # Checks is there any settings with a given key
      #
      # @param key [String, Symbol] A key for checking
      # @return [Boolean]
      def exists_for_key?(key)
        get_by_keys(key).any?
      end

      # Creates a new setting with a given values
      #
      # @param values [Hash] A values for a new setting
      # @return [Settingify::Setting] A just created setting model
      def create(values)
        Settingify::Setting.create(values)
      end

      # Fetches settings by a bunch of keys
      #
      # @param keys [Array<String>, Array<Symbol>] An array of keys for which
      #   settings should be fetched
      # @return [Array<Settingify::Setting>] An array with setting models
      def get_by_keys(keys)
        Settingify::Setting.where(key: keys)
      end

      # Removes all settings entries from the data source
      #
      # @return
      def delete_all
        Settingify::Setting.delete_all
      end

      # Provides a count of settings entries in the data source
      #
      # @return [Integer] A number of entries
      def count
        Settingify::Setting.count
      end
    end
  end
end
