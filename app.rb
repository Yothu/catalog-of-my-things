require_relative './book.rb'

class App
  def initialize
    @books = []
    @labels = []
  end

    def list_all_books
      @books.each do |book|
        puts "publish_date: #{book.publish_date}, archived: #{book.archived}, publisher : #{book.publisher}, cover_state: #{book.cover_state}"
      end
    end

    def list_all_labels
      @labels.each do |label|
        puts "title: #{label.title}, color: #{label.color}"
      end
    end

    def add_book
        puts 'Please enter the publisher name?'
        publisher = gets.chomp

        puts 'Please enter the cover state of the book?'
        cover_state = gets.chomp

        puts 'Please enter "true" if the book is archived and "false" if it is not:[T or F]'
        archived = gets.chomp

        puts 'Please enter publish date?'
        publish_date = gets.chomp

        @books.push(Book.new(publish_date, archived, publisher, cover_state))
    end


end