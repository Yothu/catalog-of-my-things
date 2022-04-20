require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, archived, publisher, cover_state, id = Time.now.to_f.to_s)
    super(publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super == true || @cover_state == 'bad'

    false
  end
end
