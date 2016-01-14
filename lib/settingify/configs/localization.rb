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

      #
      # Specifies base locale.
      # To this locale will be fall back if there is no value in the current locale
      #
      # Values:
      # symbol
      #
      # Default:
      # :en
      #
      attr_accessor :default_locale

      def initialize
        @active            = false
        @available_locales = []
        @default_locale    = :en
      end
    end
  end
end
