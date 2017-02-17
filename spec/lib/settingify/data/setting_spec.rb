require 'spec_helper'

describe Settingify::Data::Setting do
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :type }
  it { is_expected.to respond_to :default }
end
