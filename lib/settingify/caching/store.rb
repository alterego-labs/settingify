module Settingify
  module Caching
    # Provides an abstraction of the cache store
    #
    # Under the hood it uses some provider, which in a case of Rails is `Rails.cache`.
    # You can define your own providers. The only needed interface is:
    # - `#fetch(key, &block)`
    # - `#delete_matched(pattern)`
    class Store
      CACHE_KEY_PREFIX = 'settingify_cache_for_'.freeze

      def initialize(provider:)
        @provider = provider 
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
