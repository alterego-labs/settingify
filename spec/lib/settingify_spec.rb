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
      expect_any_instance_of(Settingify::Repos::Settings).to receive(:list).and_call_original
      expect(Settingify.registered_settings).to be_a(Array)
    end
  end

  describe '.groups' do
    it 'calls all on repo' do
      expect_any_instance_of(Settingify::Repos::Groups).to receive(:all).and_call_original
      expect(Settingify.groups).to be_a(Array)
    end
  end

  context 'real testing' do
    before(:each) do
      Settingify::Repos::Settings.instance.clear!
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

      it 'defines new group' do
        expect(Settingify.groups.count).to eq 1
        group = Settingify.groups.first
        expect(group.key).to eq :group1
      end
    end
  end

  context 'caching API' do
    describe '#clear_cache' do
      let(:cache_store) { double(:cache_store) }

      before do
        allow(Settingify.config).to receive(:cache_store) { cache_store }
        expect(Settingify.config).to receive(:cache_enabled?) { is_cache_enabled }
      end

      context 'WHEN cache is enabled' do
        let(:is_cache_enabled) { true }

        it 'calls cache clearnup' do
          expect(cache_store).to receive(:clear)
          Settingify.clear_cache
        end
      end

      context 'WHEN cache is disabled' do
        let(:is_cache_enabled) { false }

        it 'does not call cache clearnup' do
          expect(cache_store).to receive(:clear).exactly(0).times
          Settingify.clear_cache
        end
      end
    end
  end
end
