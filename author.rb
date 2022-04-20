require_relative './item'

class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name, id = Time.now.to_f.to_s)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = id
  end

  def add_item(item)
    @items.push(item) if item.instance_of?(Item) && !(@items.include? item)
    item.author = self if @items.include? item
  end
end
