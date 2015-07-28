require 'spec_helper'

module SomeBuilder
  extend Settingify::SettingBuilder
end

describe Settingify::SettingBuilder do
  describe 'defining settings' do
    it 'successfully' do
      SomeBuilder.setting(:some_setting)
      expect(Settingify.some_setting).to eq ''
    end

    context 'when default is Integer' do
      it 'returns integer value' do
        SomeBuilder.setting :some_int_value, type: :integer, default: 12
        expect(Settingify.some_int_value).to eq 12
      end
    end
  end
end
