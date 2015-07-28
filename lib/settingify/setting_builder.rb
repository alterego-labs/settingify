module Settingify
  module SettingBuilder
    def setting(name, type: String, default: '')
      define_setting name, type, default
    end

    private

    def define_setting(name, type, default)
      SettingsList.send :define_method, name do
        Reader.new(name, type, default).call
      end
    end
  end
end
