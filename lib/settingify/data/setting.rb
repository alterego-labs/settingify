module Settingify
  module Data
    class Setting < Struct.new(:name, :type, :default)
    end
  end
end
