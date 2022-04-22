require_relative './app'

def main_menu
  puts 'Please choose an option by enterin a number:'
  puts '1) List all Books'
  puts '2) List all Music Albums'
  puts '3) List all Games'
  puts '4) List all Movies'
  puts '5) List all Genres'
  puts '6) List all Labels'
  puts '7) List all Authors'
  puts '8) List all Sources'
  puts '9) Add a Book'
  puts '10) Add a Music Album'
  puts '11) Add a Game'
  puts '12) Add a Movie'
  puts '13) Exit the program'
end

def options(app)
  input = gets.chomp.to_i
  case input
  when 1 then app.books.list_all_books
  when 2 then app.musics.list_all_music_albums
  when 3 then app.games.list_all_games
  when 4 then app.movies_sources.list_all_movies
  when 5 then app.genres.list_all_genre
  when 6 then app.labels.list_all_labels
  when 7 then app.authors.list_all_authors
  when 8 then app.movies_sources.list_all_sources
  when 9 then app.books.add_book
  when 10 then app.musics.add_music_album
  when 11 then app.games.add_game_menu
  when 12 then app.movies_sources.add_movie
  when 13 then 13
  else
    puts 'Invalid number, please try again!'
  end
end

def main
  running = true

  app = App.new

  app.obtain_data
  puts 'Welcome to our App! 🎉'
  while running
    main_menu
    option = options(app)
    break if option == 13
  end
  app.save_data

  puts 'Thanks for using this App!! ✨'
end

main
