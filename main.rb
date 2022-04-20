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

def main
  running = true
  app = App.new

  puts 'Welcome to our App! 🎉'
  while running
    main_menu
    option = app.options
    break if option == 13
  end
  puts 'Thanks for using this App!! ✨'
end

main
