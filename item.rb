require_relative './years_difference'

class Item
  include YearsDifference
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived, id = Time.now.to_f.to_s)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  attr_writer :genre, :author, :label, :source

  def can_be_archived?
    return true if years_to_today(@publish_date) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
end
