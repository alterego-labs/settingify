module Settingify
  module DSL
    def setting(name, type: String, default: '')
      setting_item = build_setting_item(name, type, default)
      register_setting setting_item
      define_setting setting_item
    end

    def group(name, &block)
      Builders::Group.call(name, &block)
    end

    private

    def build_setting_item(name, type, default)
      RepoItem.new(name, type, default)
    end

    def define_setting(setting_item)
      Settingify.singleton_class.instance_eval do
        define_method setting_item.name do
          Reader.new(setting_item).call
        end
      end
    end

    def register_setting(setting_item)
      Settingify::Repos::Settings.instance.add setting_item
    end
  end
end
