module Settingify
  module SettingBuilder
    def setting(name, type: String, default: '')
      register_setting name, type, default
      define_setting name, type, default
    end

    private

    def define_setting(setting_name, type, default)
      Settingify.singleton_class.instance_eval do
        define_method setting_name do
          Reader.new(name, type, default).call
        end
      end
    end

    def register_setting(name, type, default)
      Settingify::Repo.instance.add RepoItem.new(name, type, default)
    end
  end
end
