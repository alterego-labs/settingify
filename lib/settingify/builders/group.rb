module Settingify
  module Builders
    # A class which encapsulates a logic for defining and registering a group of settings
    class Group < Struct.new(:name)
      # Helps to make a class as a callable object
      #
      # Under the hood it instantiates new class instance and sends a call message to it.
      def self.call(*opts, &block)
        new(*opts).call(&block)
      end

      # Calls builder for group
      def call(&block)
        find_by_name || define_new_group
      end

      private

      def find_by_name
        Settingify::Repos::Groups.instance.find_by_name(self.name)
      end

      def define_new_group
        group = Settingify::Data::Group.new(name)
        Settingify::Repos::Groups.instance.add group
        group
      end
    end
  end
end
