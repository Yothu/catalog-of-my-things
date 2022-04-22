require_relative './game'
require 'json'
require_relative './input'

class GameList
  include Input

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
    publish_date = text { 'Publication date?' }

    multiplayer = y_n { 'Is multiplayer? [Y/N]' }

    last_played_at = text { 'When was last played?' }

    archived = y_n { 'Is archieved? [Y/N]' }

    add_game(multiplayer, last_played_at, publish_date, archived)
  end

  def add_game(multiplayer, last_played_at, publish_date, archived, id = Time.now.to_f.to_s)
    new_game = Game.new(multiplayer, last_played_at, publish_date, archived, id)

    @games << new_game if new_game.instance_of?(Game)
  end

  def save_games
    line = @games.map do |game|
      {
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        archived: game.archived,
        id: game.id
      }
    end

    json_line = JSON.generate(line)
    File.write('games.json', "#{json_line}\n", mode: 'w')
  end

  def obtain_games
    file_path = 'games.json'
    if File.exist?(file_path)
      raw_data = File.read('games.json')
      clean_data = JSON.parse(raw_data)
      clean_data.map do |game|
        new_game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], game['archived'],
                            game['id'])
        add_game(new_game.multiplayer, new_game.last_played_at, new_game.publish_date, new_game.archived, new_game.id)
      end
    else
      File.new('games.json', 'w')
    end
  end
end
