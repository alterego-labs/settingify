module Settingify
  module Builders
    # A class which encapsulates a logic for defining and registering a grouped setting
    class GroupedSetting < Struct.new(:group_name, :setting_name, :type, :default)
      # Helps to make a class as a callable object
      #
      # Under the hood it instantiates new class instance and sends a call message to it.
      def self.call(*opts, &block)
        new(*opts).call(&block)
      end

      def call
        group = resolve_group
        setting = build_new_setting
        attach setting, group
      end

      private

      def resolve_group
        Builders::Group.call(group_name)
      end
      
      def build_new_setting
        Builders::Setting.call(setting_name, type, default)
      end

      def attach(setting, group)
        group.add setting.name
      end
    end
  end
end
