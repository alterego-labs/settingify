require 'spec_helper'

describe Settingify::Configs::Main do
  it { is_expected.to respond_to :localization }

  describe 'caching configuration' do
    it 'allows to read cache store' do
      expect(subject).to respond_to :cache_store
    end

    it 'does not allow to set cache store directly' do
      expect(subject).to respond_to :cache_store
    end

    context 'WHEN cache is not set up' do
      its(:cache_enabled?) { is_expected.to be_falsey }
    end

    context 'WHEN cache is set up' do
      before do
        allow(Settingify::Persistence::Repo).to receive(:prepend)
        subject.setup_cache provider: double
      end

      its(:cache_enabled?) { is_expected.to be_truthy }
    end
  end
end
