module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        head, *tail = self

        tail = MyArray.new(tail)

        block.call(head)

        return if tail.empty?

        tail.my_each(&block)

        self
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
      def my_reduce(acc = nil)
        my_each { |element| acc = acc.nil? ? element : yield(acc, element) }
        acc
      end
    end
  end
end
