class Source
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.source = self
    @items << item unless @items.include?(item)
  end

  def to_obj(id, name)
    {
      'id' => id,
      'name' => name
    }
  end
end
