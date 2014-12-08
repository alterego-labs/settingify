module Settingify
  class Reader
    attr_reader :key, :default, :type

    def initialize(key, type, default)
      @key = key
      @type = type
      @default = default
    end

    def read_value
      return default unless table_exists?
      type db_setting.value
    end

    private

    def table_exists?
      ActiveRecord::Base.connection.table_exists? 'settingify_setting'
    end

    def db_setting
      Setting.where(key: key).first_or_initialize(value: default)
    end
  end
end
