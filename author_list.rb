class AuthorList
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
    print 'First Name?'
    first_name = gets

    print 'Last Name?'
    last_name = gets

    add_author(first_name, last_name)
  end

  def add_author(first_name, last_name)
    new_author = Author.new(first_name, last_name)

    @authors << new_author if new_author.instance_of?(Author)
  end
end
