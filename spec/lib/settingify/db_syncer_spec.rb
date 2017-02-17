require 'spec_helper'

describe Settingify::DbSyncer do
  subject(:syncer) { described_class.new }

  before do
    Settingify::Setting.delete_all
    Settingify::Repos::Settings.instance.clear!
    Settingify.prepare_settings do
      setting :setting1, default: 'value1'
    end
  end

  after do
    Settingify::Repos::Settings.instance.clear!
  end

  context 'when setting does not exists in db' do
    it 'creates new record' do
      expect{
        syncer.call
      }.to change(Settingify::Setting, :count).by(1)
    end
  end

  context 'when setting already exists in db' do
    before do
      Settingify::Setting.create(key: :setting1)
    end

    after do
      Settingify::Setting.delete_all
    end

    it 'does not creates new record' do
      expect{
        syncer.call
      }.to_not change(Settingify::Setting, :count)
    end
  end
end
