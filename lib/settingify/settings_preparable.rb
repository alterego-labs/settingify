module Settingify
  module SettingsPreparable
    include DSL

    def prepare_settings(&block)
      raise Settingify::PrepareSettingsWithoutBlockError, 'Block must be passed!' unless block_given?
      instance_eval(&block)
    end
  end
end
