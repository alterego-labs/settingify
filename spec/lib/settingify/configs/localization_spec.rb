require 'spec_helper'

describe Settingify::Configs::Localization do
  describe 'default values' do
    subject { described_class.new }

    its(:active) { is_expected.to be_falsey }
    its(:available_locales) { is_expected.to be_empty }
  end

  describe 'available attributes' do
    it { is_expected.to respond_to :active= }
    it { is_expected.to respond_to :available_locales= }
  end
end
