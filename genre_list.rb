require_relative 'genre'

class GenreList
  def initialize
    @genres = []
  end

  def add_genre
    puts 'Please add the genre'
    genre_input = gets.chomp
    @genres << Genre.new(genre_input)
    puts 'Genre registered succesfully'
  end

  def list_all_genre
    @genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
  end
end
