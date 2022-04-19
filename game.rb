require_relative './item'
require_relative './years_difference'

class Game < Item
  include YearsDifference

  def initialize(multiplayer, last_played_at, publish_date, archived, id = Time.now.to_f.to_s)
    super(publish_date, archived, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    return true if super == true && years_to_today(@last_played_at)
  end
end
