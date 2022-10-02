module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self
          yield item
        end
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(self.class.new) { |arr, item| arr << (yield item) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) { |arr, item| item.nil? ? arr : arr << item }
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial_value = nil)
        acc = initial_value
        for i in self
          if acc.nil?
            acc = i
            next
          end
          acc = yield(acc, i)
        end
        acc
      end
    end
  end
end
