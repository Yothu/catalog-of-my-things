class Item
  attr_accessor :id, :publish_date, :archived

  def initialize(publish_date, archived, id = Random.rand(1..1000))
     @id = id
     @publish_date = publish_date
     @archived = archived
  end

  def genre=(value)
    @genre = value
  end

  def author=(value)
    @author = value
  end

  def label=(value)
    @label = value
  end

  def source=(value)
    @source = value
  end

  def move_to_archived?
  end

  def can_be_archived
    time = Time.now
    year = time.year
    published_year = @publish_date.year
    results = year - published_year
    results > 10 ? true : false
  end
  
  private :id, :can_be_archived, :archived

end
