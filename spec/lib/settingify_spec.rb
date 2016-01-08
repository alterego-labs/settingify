require 'spec_helper'

describe Settingify do
  describe '.prepare_settings' do
    context 'when no block passed' do
      it 'raises exception' do
        expect{
          Settingify.prepare_settings
        }.to raise_error(Settingify::PrepareSettingsWithoutBlockError)
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

  context 'real testing' do
    before(:each) do
      Settingify::Repo.instance.clear!
    end

    describe 'grouped settings' do
      before(:each) do
        Settingify.prepare_settings do
          setting :ungrouped_setting

          group :group1 do
            setting :grouped_setting, default: :grouped_value
          end
        end
      end

      it 'defines grouped setting as well as ungrouped one' do
        expect(Settingify).to respond_to(:ungrouped_setting)
        expect(Settingify).to respond_to(:grouped_setting)
      end
    end
  end
end
