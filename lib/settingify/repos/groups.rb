require 'singleton'

module Settingify
  module Repos
    # Keeps all defined setting groups
    #
    # This repo can has only one instance, so it is singleton one.
    class Groups
      include Singleton

      # Initializes new repo instance
      #
      # Actually this method can be called from outside.
      def initialize
        @groups = []
      end

      # Provides a list of all defined groups
      #
      # @return [Array<Settingify::Data::Group>]
      def all
        @groups
      end

      # Adds new group into a repo
      #
      # @param item [Settingify::Data::Group] - A new group
      # @return [Settingify::Repo::Groups]
      def add(item)
        @groups << item
        self
      end

      # Seeks for group with a specified name
      #
      # @param group_name [String] - A name of a needed group
      # @return [Settingify::Data::Group] - a group data, when it exists
      # @return [nil] - when group with a passed name does not exist
      def find_by_name(group_name)
        @groups.find { |group| group.key == group_name }
      end
    end
  end
end
