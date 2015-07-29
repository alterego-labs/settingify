require 'spec_helper'

describe Settingify do
  describe '.prepare_settings' do
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

  describe '.registered_settings' do
    it 'calls list on repo' do
      expect(Settingify::Repo).to receive_message_chain(:instance, :list)
      Settingify.registered_settings
    end
  end
end
