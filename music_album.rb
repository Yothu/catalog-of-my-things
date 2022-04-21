require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :id

  def initialize(on_spotify, publish_date, archived, id = Random.rand(1..1000))
    super(publish_date, archived, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify ? true : false
  end
end
