module Settingify
  module Caching
    # Provides an abstraction of the cache store
    #
    # Under the hood it uses some provider, which in a case of Rails is `Rails.cache`.
    # You can define your own providers. The only needed interface is:
    # - `#fetch(key, &block)`
    # - `#delete_matched(pattern)`
    #
    # Basically, this class is not more than a wrapper to provide some stable interface for internal
    # usage. All real caching mechanism is implemented inside providers.
    class Store
      CACHE_KEY_PREFIX = 'settingify_cache_for_'.freeze

      def initialize(provider:)
        @provider = provider 
      end

      # Builds cache key based on the setting's key
      #
      # @return [String]
      def build_cache_key(setting_key)
        "#{CACHE_KEY_PREFIX}#{setting_key}"
      end

      # Fetches the value with is related to the passed key
      #
      # If the entry with the passed key does not exists then the result of the passed block will
      # be returned. Also that result will be saved inside the cache under the incoming key.
      #
      # @param key [String] - cache key
      # @return [Object] - cache entry value
      def fetch(key, &block)
        provider.fetch(key, &block)
      end

      # Eliminates all entries which are related to the Settingify
      def clear
        provider.delete_matched("#{CACHE_KEY_PREFIX}*")
      end

      private

      attr_reader :provider
    end
  end
end
