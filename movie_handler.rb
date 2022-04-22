require 'json'
require_relative 'movie'
require_relative 'source'
require_relative './input'

class MovieHandler
  attr_accessor :movie

  include Input
  def initialize
    @movies = []
    @sources = []
  end

  def create_source
    print 'Source: '
    source_name = gets.chomp
    Source.new(source_name)
  end

  def add_movie
    puts
    print 'Movie name: '
    name = gets.chomp
    print 'Published Date: '
    publish_date = gets.chomp

    silent = y_n { 'Silent? [Y/N]:' }

    archived = y_n { 'Archived? [Y/N]:' }

    source = create_source
    movie = Movie.new(name, publish_date, silent, archived)
    source.add_item(movie)
    @sources.push(source) unless @sources.include?(source)
    @movies.push(movie)

    puts
    puts 'Successfully added movie!'
    puts
  end

  def list_all_movies
    if @movies.empty?
      puts 'Sorry! Right now we have no movies'
    else
      puts 'All movies are: '
      puts
      @movies.each do |movie|
        puts "Title: '#{movie.name}', Published_Date: #{movie.publish_date}, Silent: #{movie.silent}"
      end
      puts
    end
  end

  def list_all_sources
    if @sources.any?
      puts
      puts 'All sources are: '
      @sources.each_with_index { |source, index| puts "#{index})  ID: #{source.id}, Name: '#{source.name}'" }
      puts
    else
      puts 'Sorry! We have no source details'
    end
  end

  def save_movies
    movies = @movies.map do |movie|
      movie.to_obj(movie.id, movie.name, movie.publish_date, movie.silent, movie.archived)
    end

    File.write('movies.json', JSON.generate(movies), mode: 'w')
  end

  def save_sources
    sources = @sources.map do |source|
      source.to_obj(source.id, source.name)
    end

    File.write('sources.json', JSON.generate(sources), mode: 'w')
  end

  def load_movies_from_files
    file = 'movies.json'

    if File.exist? file
      File.open(file)
      JSON.parse(File.read(file)).map do |movie|
        new_movie = Movie.new(movie['publish_date'], movie['silent'], movie['archived'], movie['name'])
        new_movie.id = movie['id']
        @movies.push(new_movie)
      end
    else
      File.new(file, 'w')
      []
    end
  end

  def load_sources_from_files
    file = 'sources.json'

    if File.exist? file
      File.open(file)
      JSON.parse(File.read(file)).map do |source|
        new_source = Source.new(source['name'])
        new_source.id = source['id']
        new_source.items = source['items']
        @sources.push(new_source)
      end
    else
      File.new(file, 'w')
      []
    end
  end
end
