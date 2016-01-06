module Settingify
  module SettingBuilder
    def setting(name, type: String, default: '')
      register_setting name, type, default
      define_setting name, type, default
    end

    private

    def define_setting(name, type, default)
      SettingsList.send :define_method, name do
        Reader.new(name, type, default).call
      end
    end

    def register_setting(name, type, default)
      Settingify::Repo.instance.add RepoItem.new(name, type, default)
    end
  end
end
