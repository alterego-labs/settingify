require 'spec_helper'

describe Settingify::Reader do
  let(:key) { 'reader_setting' }
  let(:type) { String }
  let(:default) { 'reader_value' }

  subject(:reader) { described_class.new(key, type, default) }

  context 'when table does not exists' do
    it 'returns default value' do
      expect(reader.read_value).to eq default
    end
  end
end
