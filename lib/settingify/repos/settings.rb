require 'singleton'

module Settingify
  module Repos
    # Keeps all defined settings
    #
    # This repo can has only one instance, so it is singleton one.
    class Settings
      include Singleton

      # Initializes new repo instance
      #
      # Actually this method can be called from outside.
      def initialize
        @settings = []
      end

      # Provides a list of all defined settings
      #
      # @return [Array<Settingify::Data::Setting>]
      def list
        @settings
      end

      # Adds new setting into a repo
      #
      # @param item [Settingify::Data::Setting] - A new setting
      # @return [Settingify::Repo::Settings]
      def add(item)
        @settings << item
        self
      end

      # Cleans up all defined settings
      #
      # @return
      def clear!
        @settings.each(&method(:undef_method_for))
        @settings.clear
      end

      private

      def undef_method_for(item)
        Settingify.singleton_class.send :remove_method, item.name
      end
    end
  end
end
