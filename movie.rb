require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_accessor :silent, :name

  def initialize(name, publish_date, silent, archived)
    super(publish_date, archived)
    @silent = silent
    @name = name
  end

  def can_be_archived?
    super() || @silent
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'publish_date' => @publish_date,
      'silent' => @silent,
      'archived' => @archived
    }.to_json(*args)
  end

  private :can_be_archived?
end
