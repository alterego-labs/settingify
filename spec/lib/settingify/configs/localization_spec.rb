require 'spec_helper'

describe Settingify::Configs::Localization do
  describe 'default values' do
    subject { described_class.new }

    its(:active) { is_expected.to be_falsey }
    its(:available_locales) { is_expected.to be_empty }
    its(:default_locale) { is_expected.to eq :en }
  end

  describe 'available attributes' do
    it { is_expected.to respond_to :active= }
    it { is_expected.to respond_to :available_locales= }
    it { is_expected.to respond_to :default_locale= }
  end
end
