module Settingify
  class ActiveRecordHelpers
    class << self
      def table_exists?(table_name)
        @_table_exists ||= ActiveRecord::Base.connection.table_exists?(table_name)
      end
    end
  end
end
