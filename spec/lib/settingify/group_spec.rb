require 'spec_helper'

describe Settingify::Group do
  subject(:group) { described_class.new(:test_group) }

  describe '#title' do
    it 'provides localized title' do
      expect(I18n).to receive(:t)
      group.title
    end
  end

  describe '#add' do
    it 'adds setting by key into group' do
      group.add :grouped_setting
      setting_keys = group.instance_variable_get("@setting_keys")
      expect(setting_keys).to include(:grouped_setting)
    end
  end
end
