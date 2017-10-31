module Settingify
  module Configs
    class Main
      attr_reader :cache_store

      def localization(&block)
        @_localization_config ||= Configs::Localization.new
        block_given? ? yield(@_localization_config) : @_localization_config
      end

      # Configure caching
      #
      # As a provider the Rails cache could be used. Basically, it is the main goal to use.
      #
      # As a side effect the method injects a caching extension inside persistence repo class.
      #
      # @param provider [#fetch, #delete_matched] - an instance of the cache provider
      def setup_cache(provider:)
        @cache_store = Settingify::Caching::Store.new(provider: provider)
        Settingify::Persistence::Repo.send :prepend, Settingify::Caching::PersistenceRepoExtension
      end

      def cache_enabled?
        !cache_store.nil?
      end
    end
  end
end
