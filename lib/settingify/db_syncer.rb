module Settingify
  #
  # Syncs defined settings with DB.
  #
  # Very useful for copying defined settings in initializer
  # to DB with goal for ability to edit through admin panel.
  #
  # You may call this class manually in rails console or use
  # built-in rake task:
  # bundle exec rake settingify:sync
  #
  # Syncing means adding new DB entries for settings
  # which not exists yet.
  #
  class DbSyncer
    def call
      settings_list.each(&method(:process_setting))
    end

    private

    def settings_list
      Settingify.registered_settings
    end

    def process_setting(setting)
      return if exists_in_db?(setting)
      add_record_for setting
    end

    def exists_in_db?(setting)
      Settingify::Setting.where(key: setting.name).any?
    end

    def add_record_for(setting)
      values = create_value_parameters(setting.default)
      Settingify::Setting.create values.merge(key: setting.name)
    end

    private

    def create_value_parameters(default)
      if Settingify.config.localization.active
        build_localized_value_parameters(default)
      else
        {value: default}
      end
    end

    def build_localized_value_parameters(default)
      Settingify.config.localization.available_locales.each_with_object({}) do |locale, hash|
        hash["value_#{locale}"] = default
      end
    end
  end
end
