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
  end
end
