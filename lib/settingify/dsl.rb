module Settingify
  module DSL
    def setting(name, type: String, default: '')
      register_setting name, type, default
      define_setting name, type, default
    end

    def group(name, &block)
      Builders::Group.call(name, &block)
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
      Settingify::Repos::Settings.instance.add RepoItem.new(name, type, default)
    end
  end
end
