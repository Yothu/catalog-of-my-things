require_relative './item'

class Game < Item
  def initialize(multiplayer, last_played_at, publish_date, archived, id = Time.now.to_f.to_s)
    super(publish_date, archived, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
