require 'spec_helper'

describe Settingify::Setting do
  subject(:setting) { described_class.new(key: :cool_setting) }

  describe '#title' do
    it 'returns setting title' do
      expect(setting.title).to_not be_blank
    end
  end

  describe '#description' do
    it 'returns setting description' do
      expect(setting.description).to_not be_blank
    end
  end
end
