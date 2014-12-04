module Settingify
  module SettingBuilder
    def self.setting(name, type: String, default: '')
      Settingify.instance_eval <<-CODE
        def #{name}
          #{type}('#{default}')
        end
      CODE
    end
  end
end
