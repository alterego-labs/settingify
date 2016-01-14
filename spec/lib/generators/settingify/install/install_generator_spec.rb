require 'spec_helper'

require File.join(Dir.pwd, 'lib/generators/settingify/install/install_generator.rb')

describe Settingify::Generators::InstallGenerator, type: :generator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  context 'when localization is disabled' do
    before do
      prepare_destination
      run_generator
    end

    specify do
      expect(destination_root).to have_structure {
        directory 'config' do
          directory 'initializers' do
            file 'settingify.rb' do
              contains "Settingify.config"
              contains "Settingify.prepare_settings"
            end
          end
        end
        directory 'db' do
          directory 'migrate' do
            migration 'create_settingify_setting' do
              contains "t.string :value"
            end
          end
        end
      }
    end
  end

  context 'when localization is enabled' do
    before do
      Settingify.config.localization.available_locales = [:fr, :nl]
      Settingify.config.localization.active = true
      prepare_destination
      run_generator
    end

    after do
      Settingify.config.localization.available_locales = []
      Settingify.config.localization.active = false
    end

    specify do
      expect(destination_root).to have_structure {
        directory 'config' do
          directory 'initializers' do
            file 'settingify.rb' do
              contains "Settingify.config"
              contains "Settingify.prepare_settings"
            end
          end
        end
        directory 'db' do
          directory 'migrate' do
            migration 'create_settingify_setting' do
              contains "t.string :value_fr"
              contains "t.string :value_nl"
            end
          end
        end
      }
    end
  end
end
