require './item'

class Genre
  attr_accessor :name, :items

  def initialize(name, id = Random.rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    items << item
    item.genre = self
  end

  # private :id, :items
end
