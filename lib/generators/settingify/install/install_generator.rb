require 'rails/generators/migration'

module Settingify
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "Add migration and copy initializer"

      class_option :localization, type: :boolean, default: false, desc: 'Enable or disable localization feature.'
      class_option :locales, type: :string, default: '', desc: 'List of available locales. Separated by comma'

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def setup_localization
        if options[:localization]
          Settingify.config do |config|
            config.localization do |localization|
              localization.active = options[:localization]
              localization.available_locales = options[:locales].split(',').map(&:to_sym)
            end
          end
        end
      end

      def copy_migrations
        migration_template "create_settingify_setting.rb.erb", "db/migrate/create_settingify_setting.rb"
      end

      def copy_initializer
        copy_file "settingify.rb", "config/initializers/settingify.rb"
      end
    end
  end
end
