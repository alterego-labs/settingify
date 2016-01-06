require 'spec_helper'

describe Settingify::Reader do
  let(:key) { 'reader_setting' }
  let(:type) { String }
  let(:default) { 'reader_value' }

  subject(:reader) { described_class.new(key, type, default) }

  context 'when table does not exists' do
    before do
      expect(reader).to receive(:table_exists?).and_return false
    end

    it 'returns default value' do
      expect(reader.call).to eq default
    end
  end

  context 'when table is exists' do
    let(:db_value) { "#{default} - db" }

    before do
      expect(reader).to receive(:table_exists?).and_return true
    end

    context 'and record exists' do
      before(:each) do
        Settingify::Setting.create key: key, value: db_value
      end

      it 'returns value from db' do
        expect(reader.call).to eq db_value
      end
    end

    context 'and record not exists' do
      before(:each) do
        Settingify::Setting.delete_all
      end

      it 'returns default value' do
        expect(reader.call).to eq default
      end
    end
  end
end
