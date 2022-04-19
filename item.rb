require_relative './years_difference'

class Item
  include YearsDifference
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived, id = Time.now.to_f.to_s)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include? self
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include? self
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include? self
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include? self
  end

  def can_be_archived?
    return true if years_to_today(@publish_date) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
end
