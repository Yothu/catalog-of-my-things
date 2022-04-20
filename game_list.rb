class GameList
  def initialize
    @games = []
  end

  def list_all_games
    puts 'Games:'
    num = 1
    @games.each do |game|
      puts "Game #{num}"
      puts "  Publish date: #{game.publish_date}"
      puts "  Multiplayer: #{game.multiplayer}"
      puts "  Last played at: #{game.last_played_at}"
      puts "  Archieved: #{game.archived}"
      num += 1
    end
    puts
  end

  def add_game_menu
    print 'Publication date?'
    publish_date = gets

    print 'Is multiplayer?'
    multiplayer = gets

    print 'When was last played?'
    last_played_at = gets

    print 'Is archieved?'
    archived = gets

    add_game(multiplayer, last_played_at, publish_date, archived)
  end

  def add_game(multiplayer, last_played_at, publish_date, archived)
    new_game = Game.new(multiplayer, last_played_at, publish_date, archived)

    @games << new_game if new_game.instance_of?(Game)
  end
end
