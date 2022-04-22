require_relative './item'
require_relative './years_difference'

class Game < Item
  include YearsDifference

  attr_reader :last_played_at, :multiplayer, :id

  def initialize(multiplayer, last_played_at, publish_date, archived, id = Time.now.to_f.to_s)
    super(publish_date, archived, id)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    return true if super == true && years_to_today(@last_played_at) > 2
  end
end
