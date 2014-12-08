module Settingify
  module SettingBuilder
    def setting(name, type: String, default: '')
      define_setting name, type, default
    end

    private

    def define_setting(name, type, default)
      SettingsList.class_eval <<-CODE
        def #{name}
          Reader.new('#{name}', #{type}, '#{default}').read_value
        end
      CODE
    end
  end
end
