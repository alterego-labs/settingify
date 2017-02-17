module Settingify
  module Builders
    class Group < Struct.new(:name, :block)
      include SettingsPreparable

      def self.call(*opts, &block)
        new(*opts).call(&block)
      end

      def call(&block)
        self.prepare_settings(&block)
      end

      def setting(name, type: String, default: '')
        attach_to_group(name)
        super
      end

      private

      def attach_to_group(setting_key)
        group = fetch_group
        group.add setting_key
      end

      def fetch_group
        Settingify::Repos::Groups.instance.find_by_name(self.name) || define_new_group
      end

      def define_new_group
        group = Settingify::Data::Group.new(name)
        Settingify::Repos::Groups.instance.add group
        group
      end
    end
  end
end
