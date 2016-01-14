module Settingify
  module Configs
    class Localization
      attr_accessor :active
      attr_accessor :available_locales
      attr_accessor :default_locale

      def initialize
        @active            = false
        @available_locales = []
        @default_locale    = :en
      end
    end
  end
end
