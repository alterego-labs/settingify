module Settingify
  class Reader < Struct.new(:key, :type, :default)
    def call
      return default unless table_exists?
      Caster.new(type, db_value).call
    end

    private

    def table_exists?
      ActiveRecordHelpers.table_exists? Settingify::TABLE_NAME
    end

    def db_setting
      DbReader.new(key, default).call
    end

    def db_value
      db_setting.value
    end
  end
end
