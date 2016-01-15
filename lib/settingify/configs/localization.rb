module Settingify
  module Configs
    class Localization
      #
      # Specifies if localization feature either is active or not.
      #
      # Values:
      # true/false
      #
      # Default:
      # false
      #
      attr_accessor :active

      #
      # Contains locales array for that settingify must provides localized settings.
      #
      # Values:
      # array of symbols
      #
      # Default:
      # empty array
      #
      attr_accessor :available_locales

      def initialize
        @active            = false
        @available_locales = []
      end
    end
  end
end
