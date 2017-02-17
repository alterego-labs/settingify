module Settingify
  module DSL
    # A class which provides a context for defining and describing a group of settings
    class Group < Struct.new(:name)
      # Provides DSL for defining settings
      #
      # @param setting_name [Symbol] A name or key of a setting
      # @param type [Symbol, Object] A name of a setting's type or a reference to a type's class
      # @param default [String] A default value for a setting
      def setting(setting_name, type: String, default: '')
        Builders::GroupedSetting.call(name, setting_name, type, default)
      end
    end
  end
end
