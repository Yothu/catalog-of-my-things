require_relative 'movie'
require_relative 'source'

class MovieHandler
  attr_accessor :movie

  def initialize
    @movies = []
    @sources = []
  end

  def create_source
    print 'Source: '
    source_name = gets.chomp
    Source.new(source_name)
  end

  def handle_sources
    if @sources.any?
      print "enter 'N' to create a new source or 'S' to select an existing one:  "
      option = gets.chomp.upcase
      case option
      when 'N'
        create_source
      when 'S'
        puts 'select a source from the list by index'
        all_soucrce
        option = gets.chomp
        @sources[option.to_i]
      else
        print 'invalid entry'
      end
    else
      create_source
    end
  end

  def add_movie
    puts
    print 'Movie name: '
    name = gets.chomp
    print 'Published Date: '
    publish_date = gets.chomp
    print 'Silent? [Y/N]: '
    silent = gets.chomp != 'n'
    print 'Archived? [Y/N]: '
    archived = gets.chomp != 'n'

    source = handle_sources
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
end

# movie = MovieHandler.new

# puts movie.add_movie
# puts movie.list_all_movies
# puts movie.list_all_sources
