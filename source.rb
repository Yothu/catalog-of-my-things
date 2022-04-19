# class Source
#   attr_accessor :name
#   attr_reader :id, :items

#   def initialize(name)
#     @name = name
#     @id = Random.rand(1..1000)
#     @items = []
#   end

#   def add_item(item)
#     @items << item
#     item.source = self
#   end

#   def movies
#     @items.each do |movie|
#       return movie.move_to_archive, @id, movie.source.name if movie.source == self
#     end
#   end
# end
