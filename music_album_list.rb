require_relative 'music_album'

class MusicList
  def initialize
    @albums = []
  end

  def add_music_album
    puts 'The Album is on Spotify? (y/n)'
    spotify = gets.chomp
    spotify = true if spotify == 'y'

    puts 'Please enter the publish date?'
    publish_date = gets.chomp

    puts 'Is the album archived? (y/n)'
    archived = gets.chomp

    archived = true if archived == 'y'

    @albums << MusicAlbum.new(spotify, publish_date, archived)
    puts 'Album registered succesfully'
  end

  def list_all_music_albums
    @albums.each do |album|
      puts "publish_date: #{album.publish_date}, archived: #{album.archived},
      on_spotify: #{album.on_spotify}"
    end
  end
end
