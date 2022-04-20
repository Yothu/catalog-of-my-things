# require_relative './item_classes/book'

# module BookJson
#   def save_books(books)
#     books = @books.each_with_index.map do |book, index|
#       {
#         publish_date: book.publish_date, archived: book.archived,
#         publisher: book.publisher, cover_state: book.cover_state, index: index
#       }
#     end
#     File.write('books.json', JSON.generate(books))
#   end

#   def load_books
#     return [] unless File.exist?('books.json')

#     file = File.open('books.json')
#     read_file = File.read(file)
#     read_json = JSON.parse(read_file)

#     loaded_books = []

#     loaded_books.each do |book|
#       load_books.push(Book.new(book['publish_date'], book['archived'],
#                                book['publisher'], book[' cover_state']))
#     end

#     loaded_books
#     file.close
#   end
# end
