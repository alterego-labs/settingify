module Settingify
  class Reader < Struct.new(:setting_item)
    delegate :name, :type, :default, to: :setting_item

    def call
      return default unless table_exists?
      db_value = fetch_db_value
      cast db_value
    end

    private

    def table_exists?
      Persistence::Repo.instance.data_source_exists?
    end

    def fetch_db_value
      db_setting = DbReader.new(name, default).call
      db_setting.value
    end

    def cast(raw_value)
      Caster.new(type, raw_value).call
    end
  end
end
