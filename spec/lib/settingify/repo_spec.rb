require 'spec_helper'

describe Settingify::Repo do
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
end
