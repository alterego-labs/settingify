require 'spec_helper'

module SomeBuilder
  extend Settingify::DSL
end

describe Settingify::DSL do
  describe '#setting' do
    describe 'defining settings' do
      it 'successfully' do
        SomeBuilder.setting(:some_setting)
        expect(Settingify.some_setting).to eq ''
      end

      context 'when default is Integer' do
        it 'returns integer value' do
          SomeBuilder.setting :some_int_value, type: :integer, default: 12
          expect(Settingify.some_int_value).to eq 12
        end
      end
    end
  end

  describe '#group' do
    let(:block) { ->{ } }

    it 'calls group builder properly' do
      expect(Settingify::Builders::Group).to receive(:call).with(:another_group)

      SomeBuilder.group :another_group, &block
    end
  end
end
