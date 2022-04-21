require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_accessor :silent, :name, :id

  def initialize(name, publish_date, silent, archived)
    super(publish_date, archived)
    @silent = silent
    @name = name
  end

  def can_be_archived?
    super() || @silent
  end

  def to_obj(id, name, publish_date, silent, archived)
    {
      'id' => id,
      'name' => name,
      'publish_date' => publish_date,
      'silent' => silent,
      'archived' => archived
    }
  end

  private :can_be_archived?
end
