require 'spec_helper'

describe Settingify::DbSyncer do
  subject(:syncer) { described_class.new }

  before do
    Settingify::Persistence::Repo.instance.delete_all
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
      }.to change(Settingify::Persistence::Repo.instance, :count).by(1)
    end
  end

  context 'when setting already exists in db' do
    before do
      Settingify::Persistence::Repo.instance.create(key: :setting1)
    end

    after do
      Settingify::Persistence::Repo.instance.delete_all
    end

    it 'does not creates new record' do
      expect{
        syncer.call
      }.to_not change(Settingify::Persistence::Repo.instance, :count)
    end
  end
end
