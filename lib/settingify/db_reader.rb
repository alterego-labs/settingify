module Settingify
  class DbReader < Struct.new(:key, :default)
    def call
      Persistence::Repo.instance.first_or_default(key, default)
    end
  end
end
