require_relative './author'
require 'json'
require_relative './input'

class AuthorList
  include Input

  def initialize
    @authors = []
  end

  def list_all_authors
    puts 'Authors:'
    num = 1
    @authors.each do |author|
      puts "Author #{num}"
      puts "  First Name: #{author.first_name}"
      puts "  Lasr Name: #{author.last_name}"
      num += 1
    end
    puts
  end

  def add_author_menu
    first_name = text { 'First Name?' }

    last_name = text { 'Last Name?' }

    add_author(first_name, last_name)
  end

  def add_author(first_name, last_name, id = Time.now.to_f.to_s)
    new_author = Author.new(first_name, last_name, id)

    @authors << new_author if new_author.instance_of?(Author)
  end

  def save_authors
    line = @authors.map do |author|
      {
        first_name: author.first_name,
        last_name: author.last_name,
        id: author.id
      }
    end

    json_line = JSON.generate(line)
    File.write('authors.json', "#{json_line}\n", mode: 'w')
  end

  def obtain_authors
    file_path = 'authors.json'
    if File.exist?(file_path)
      raw_data = File.read('authors.json')
      clean_data = JSON.parse(raw_data)
      clean_data.map do |author|
        new_author = Author.new(author['first_name'], author['last_name'], author['id'])
        add_author(new_author.first_name, new_author.last_name, new_author.id)
      end
    else
      File.new('authors.json', 'w')
    end
  end
end
