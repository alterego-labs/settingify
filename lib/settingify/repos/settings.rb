require 'singleton'

module Settingify
  module Repos
    class Settings
      include Singleton

      def list
        @settings_list ||= []
        @settings_list
      end

      def add(item)
        list << item
      end

      def clear!
        list.each(&method(:undef_method_for))
        list.clear
      end

      private

      def undef_method_for(item)
        Settingify.singleton_class.send :remove_method, item.name
      end
    end
  end
end
