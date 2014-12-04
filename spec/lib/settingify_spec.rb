require 'spec_helper'

describe Settingify do
  describe 'defining settings' do
    context 'when no block passed' do
      it 'raises exception' do
        expect{
          Settingify.prepare_settings
        }.to raise_exception
      end
    end

    context 'when block passed' do
      it 'successfully completed' do
        Settingify.prepare_settings do
          setting :ssssome, default: 'msg'
        end
        expect(Settingify.ssssome).to eq 'msg'
      end
    end
  end
end
