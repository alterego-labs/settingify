require 'active_support/core_ext/string/inflections'

module Settingify
  class Caster < Struct.new(:type, :value)
    using ContractExt

    def call
      type_class.try_convert value
    end

    private

    def type_class
      type
        .to_s
        .classify
        .constantize
    end
  end
end
