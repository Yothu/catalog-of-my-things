class Label
  attr_accessor :title, :color

  def initialize(title, color, id = Time.now.to_f.to_s)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  attr_reader :items

  def add_items(item)
    @items.push(item)
    item.label = self
  end
end
