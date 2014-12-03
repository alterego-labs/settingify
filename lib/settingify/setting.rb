module Settingify
  class Setting < ActiveRecord::Base
    self.table_name_prefix = 'settingify_'
  end
end
