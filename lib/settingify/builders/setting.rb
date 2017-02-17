module Settingify
  module Builders
    # A class which encapsulates a logic for defining and registering setting in the system
    class Setting < Struct.new(:name, :type, :default)
      # Helps to make a class as a callable object
      #
      # Under the hood it instantiates new class instance and sends a call message to it.
      def self.call(*opts, &block)
        new(*opts).call(&block)
      end

      # Provides a main logic for registering setting in the system
      def call
        setting_item = build_setting_item(name, type, default)
        register_setting setting_item
        define_setting setting_item
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
