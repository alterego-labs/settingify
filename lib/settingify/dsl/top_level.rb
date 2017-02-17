module Settingify
  module DSL
    # A class which is actually a context for top level DSL
    class TopLevel
      # Provides DSL for defining settings
      #
      # @param name [Symbol] A name or key of a setting
      # @param type [Symbol, Object] A name of a setting's type or a reference to a type's class
      # @param default [String] A default value for a setting
      def setting(name, type: String, default: '')
        setting_item = build_setting_item(name, type, default)
        register_setting setting_item
        define_setting setting_item
      end

      # Provides DSL for defining settings group
      #
      # @param name [Symbol] A name of a group
      # @yield [Settingify::DSL::Group] A DSL context for describing group of settings
      def group(name, &block)
        Builders::Group.call(name, &block)
      end

      private

      def build_setting_item(name, type, default)
        Settingify::Data::Setting.new(name, type, default)
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
end
