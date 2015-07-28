module Settingify
  class ActiveRecordHelpers
    class << self
      def table_exists?(table_name)
        ActiveRecord::Base.connection.table_exists? table_name
      end
    end
  end
end
