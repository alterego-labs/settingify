require 'rails/generators/migration'

module Settingify
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "Add migration and copy initializer"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
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
