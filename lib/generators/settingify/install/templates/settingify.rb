Settingify.config do |config|
  # Uncomment if you want to use localization feature.
  # For more information visit `lib/settingify/configs/localization.rb`
  #
  #config.localization do |localization|
    #localization.active            = false
    #localization.available_locales = []
    #localization.default_locale    = :en
  #end
end

Settingify.prepare_settings do
  # Your settings will be here
  # setting :my_setting, type: String, default: 'msg'
end
