module Settingify
  class DbReader < Struct.new(:key, :default)
    def call
      ::Settingify::Setting
        .where(key: key)
        .first_or_initialize(value: default)
    end
  end
end
