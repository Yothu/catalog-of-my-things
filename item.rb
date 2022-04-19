class Item
  attr_accessor :id, :publish_date, :archived

  def initialize(publish_date, archived, id = Random.rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  attr_writer :genre, :author, :label, :source

  def can_be_archived?
    time = Time.now
    year = time.year
    published_year = @publish_date.year
    results = year - published_year
    results > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  private :id, :can_be_archived, :archived
end

# object = Item.new(Time.new(2015, 1, 1), false)
# puts object.can_be_archived?
# puts object.move_to_archive
