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
    end
  end
end
