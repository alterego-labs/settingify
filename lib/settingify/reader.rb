module Settingify
  class Reader
    attr_reader :key, :default, :type

    def initialize(key, type, default)
      @key = key
      @type = type
      @default = default
    end

    def call
      return default unless table_exists?
      Caster.new(type, db_value).call
    end

    private

    def table_exists?
      ActiveRecord::Base.connection.table_exists? 'settingify_settings'
    end

    def db_setting
      DbReader.new(key, default).call
    end

    def db_value
      db_setting.value
    end
  end
end
