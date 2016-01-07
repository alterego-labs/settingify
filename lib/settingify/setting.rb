module Settingify
  class Setting < ActiveRecord::Base
    self.table_name_prefix = 'settingify_'

    def title
      I18n.t("settingify.settings.#{self.key}.title", self.key.to_s.humanize)
    end

    def description
      I18n.t("settingify.settings.#{self.key}.description", "Description for #{self.key} setting...")
    end
  end
end
