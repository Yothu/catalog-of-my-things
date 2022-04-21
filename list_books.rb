require_relative './input'
require_relative './book'
require 'json'

class ListBooks
  include Input

  def initialize
    @books = []
  end

  def list_all_books
    @books.each do |book|
      puts "publish_date: #{book.publish_date}, archived: #{book.archived},
      publisher : #{book.publisher}, cover_state: #{book.cover_state}"
    end
  end

  def add_book
    puts 'Please enter the publisher name?'
    publisher = gets.chomp

    puts 'Please enter the cover state of the book?'
    cover_state = gets.chomp

    archived = y_n { 'is it archived?:[Y or N]' }

    puts 'Please enter publish date?'
    publish_date = gets.chomp

    @books.push(Book.new(publish_date, archived, publisher, cover_state))
  end

  def save_books
    books = @books.each_with_index.map do |book, index|
      {
        publish_date: book.publish_date, archived: book.archived,
        publisher: book.publisher, cover_state: book.cover_state, index: index
      }
    end
    File.write('books.json', JSON.generate(books))
  end

  def load_books
    return [] unless File.exist?('books.json')

    file = File.open('books.json')
    read_file = File.read(file)
    read_json = JSON.parse(read_file)

    loaded_books = []

    read_json.each do |book|
      loaded_books.push(Book.new(book['publish_date'], book['archived'], book['publisher'], book[' cover_state']))
    end

    file.close
    @books = loaded_books
  end
end
