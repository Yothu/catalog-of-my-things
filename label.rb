class Label
  attr_accessor :title, :color, :items, :id

  def initialize(title, color, _items, id = Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_items(item)
    @items.push(item)
    item.items = self
  end

  private :id, :items
end
