module Settingify
  module SettingBuilder
    def setting(name, type: String, default: '')
      define_setting name, type, default
    end

    private

    def define_setting(name, type, default)
      SettingsList.class_eval <<-CODE
        def #{name}
          #{type}('#{default}')
        end
      CODE
    end
  end
end
