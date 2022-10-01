module Exercise
  module Arrays
    class << self
      def replace(array)
        result = []
        max_num = 0
        count = 0

        while count < array.size
          max_num = array[count] > max_num ? array[count] : max_num
          count += 1
        end

        for num in array
          new_num = num.positive? ? max_num : num
          result << new_num
          count += 1
        end
        result
      end

      def search(array, query)
        max = array.size - 1
        min = 0
        middle = 0
        num = -1

        while min <= max 
          middle = (min + max) / 2 unless array.size.zero?

          if array[middle] == query
            num = middle
            break
          elsif array[middle] > query
            max = middle - 1
          else
            min = middle + 1
          end
        end

        num
      end
    end
  end
end
