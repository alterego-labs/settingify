module Settingify
  module ContractExt
    refine Integer.singleton_class do
      def try_convert(value)
        Integer(value)
      end
    end

    refine Float.singleton_class do
      def try_convert(value)
        Float(value)
      end
    end

    refine String.singleton_class do
      def try_convert(value)
        value.to_s
      end
    end
  end
end
