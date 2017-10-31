module Settingify
  module Caching
    module PersistenceRepoExtension
      def first_or_default(key, default_value)
        cache_key = Settingify.config.cache_store.build_cache_key(key)
        Settingify.config.cache_store.fetch(cache_key) { super }
      end
    end
  end
end
