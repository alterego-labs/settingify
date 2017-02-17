module Settingify
  # Is raised when `Settingify.prepare_settings` has been called without a block.
  #
  # It means that you use an API to define settings in a wrong way.
  PrepareSettingsWithoutBlockError = Class.new(StandardError)
end
