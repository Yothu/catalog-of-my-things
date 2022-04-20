require_relative './item_classes/book'
# require_relative './list_books'
# require_relative './list_labels'
# require_relative './preserve_Book'
# require_relative './preserve_Label'
require 'json'

class App
  # include preserveBook
  # include preserveLabel

  # book_list = listBooks.new
  # label_list = listLabel.new

  def options
    input = gets.chomp.to_i
    case input
    when 1 then book_list.list_all_books
    when 2 then list_all_music_albums
    when 3 then list_all_games
    when 4 then list_all_movies
    when 5 then list_all_genre
    when 6 then label_list.list_all_labels
    when 7 then list_all_authors
    when 8 then list_all_sources
    when 9 then book_list.add_book
    when 10 then add_music_album
    when 11 then add_game
    when 12 then add_movie
    when 13
      save_data
      13
    else
      puts 'Invalid number, please try again!'
    end
  end

  def save_data
    # save_books(books)

    # save_labels(labels)
  end

  # loaded_books
  # load_labels
end
