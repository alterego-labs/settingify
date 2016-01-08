module Settingify
  class Group
    attr_reader :key, :setting_keys

    def initialize(key)
      @setting_keys = []
      @key = key
    end

    def add(setting_key)
      @setting_keys = @setting_keys
        .insert(-1, setting_key.to_sym)
        .uniq
      self
    end

    def title
      I18n.t("settingify.groups.#{key}.title", self.key.to_s.humanize)
    end

    def settings
      ::Settingify::Setting.where(key: setting_keys)
    end
  end
end
