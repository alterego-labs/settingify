require 'spec_helper'

module SomeBuilder
  extend Settingify::DSL
end

describe Settingify::Repos::Settings do
  subject(:repo) { described_class.send :new }

  describe '#list' do
    context 'when no item has been added' do
      it 'returns empty array' do
        expect(repo.list).to be_empty
      end
    end

    context 'when at least one item has been added' do
      before do
        repo.add :item
      end

      it 'returns it' do
        expect(repo.list).to include(:item)
      end
    end
  end

  describe '#add' do
    it 'adds item to list' do
      expect{
        repo.add :item
      }.to change(repo.list, :count).by(1)
    end
  end

  describe '#clear!' do
    before do
      SomeBuilder.setting(:for_clear_setting)
    end

    it 'removes all settings' do
      expect(Settingify).to respond_to :for_clear_setting
      expect(Settingify.registered_settings).to_not be_empty
      Settingify::Repos::Settings.instance.clear!
      expect(Settingify).to_not respond_to :for_clear_setting
      expect(Settingify.registered_settings).to be_empty
    end
  end
end
