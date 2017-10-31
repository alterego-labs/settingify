require 'spec_helper'

describe Settingify::Caching::Store do
  subject(:store) { described_class.new(provider: provider) }

  let(:provider) { double(:provider) }

  describe '#build_cache_key' do
    subject(:cache_key) { store.build_cache_key(entry_key) }

    let(:entry_key) { 'service_url' }

    it 'contains prefix' do
      expect(cache_key).to include(described_class::CACHE_KEY_PREFIX)
    end

    it 'contains entry key' do
      expect(cache_key).to include(entry_key)
    end
  end
end
