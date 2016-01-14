module Settingify
  module Configs
    class Main
      def localization(&block)
        @_localization_config ||= Configs::Localization.new
        block_given? ? yield(@_localization_config) : @_localization_config
      end
    end
  end
end
