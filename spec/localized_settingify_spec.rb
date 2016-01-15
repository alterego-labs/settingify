require 'spec_helper'

class Settingify::Setting
  translates :value, fallback: false
end

describe Settingify do
  context 'localized feature' do
    before do
      load 'spec/db/localized_schema.rb'
      Settingify.config do |config|
        config.localization do |localization|
          localization.active = true
          localization.available_locales = [:fr, :nl]
        end
      end
      Settingify::Repos::Settings.instance.clear!
      I18n.locale = :fr
      Settingify::Setting.create(key: :localized, value: :fr_localized)
      Settingify.prepare_settings do
        setting :localized, default: :unlocalized
      end
    end

    after do
      Settingify.config do |config|
        config.localization do |localization|
          localization.active = false
        end
      end
    end

    context 'when current locale is nl' do
      it 'returns blank string' do
        I18n.locale = :nl
        expect(Settingify.localized).to be_blank
      end
    end
  end
end
