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
        Builders::Setting.call(name, type, default)
      end

      # Provides DSL for defining settings group
      #
      # @param name [Symbol] A name of a group
      # @yield [Settingify::DSL::Group] A DSL context for describing group of settings
      def group(name, &block)
        Builders::Group.call(name, &block)
      end
    end
  end
end
