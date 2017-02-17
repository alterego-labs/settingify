require 'spec_helper'

describe Settingify::Repos::Groups do
  subject(:repo) { described_class.send :new }

  describe '#all' do
    it 'provides a list of defined groups' do
      expect(repo.all).to be_a(Array)
    end
  end

  describe '#add' do
    it 'adds new item to list' do
      expect { repo.add(:item) }.to change(repo.all, :count).by(1)
    end
  end

  describe '#find_by_name' do
    before do
      repo.instance_variable_set(:@groups, groups)
    end

    let(:groups) do
      [
        Settingify::Data::Group.new('group1'),
        Settingify::Data::Group.new('group2')
      ]
    end

    context 'WHEN a group with a passed name exists' do
      it 'returns it' do
        group = repo.find_by_name('group1')
        expect(group).to_not be_nil
        expect(group.key).to eq 'group1'
      end
    end

    context 'WHEN a group with a passed name does not exist' do
      it 'returns nil' do
        group = repo.find_by_name('group3')
        expect(group).to be_nil
      end
    end
  end
end
