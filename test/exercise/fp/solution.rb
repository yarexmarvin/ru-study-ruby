module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        scores = array.map { |film| film['country'].to_s.split(',').length > 1 ? film['rating_kinopoisk'].to_f : 0 }
        total_score = scores.reduce(0, :+)
        amount = scores.map { |score| score.positive? ? 1 : 0 }.reduce(0, :+)
        total_score / amount
      end

      def chars_count(films, threshold)
        films.reduce(0) do |sum, film|
          if !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold
            letters = film['name'].chars.count('и')
            sum += letters
          end
          sum
        end
      end
    end
  end
end
