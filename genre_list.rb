require_relative 'genre'
require 'json'

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

  def save_genres
    genres = @genres.map do |genre|
      {
        name: genre.name,
        id: genre.id
      }
    end

    json_genre = JSON.generate(genres)
    File.write('genres.json', "#{json_genre}\n", mode: 'w')
  end

  def display_genres
    file_path = 'genres.json'
    if File.exist?(file_path)
      raw_data = File.read('genres.json')
      clean_data = JSON.parse(raw_data)
      clean_data.map do |genre|
        @genres << Genre.new(genre['name'], genre['id'])
      end
    else
      File.new('genres.json', 'w')
    end
  end
end
