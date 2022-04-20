require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_accessor :silent, :name

  def initialize(name, publish_date, silent, archived)
    super(publish_date, archived)
    @silent = silent
    @name = name
  end

  private

  def can_be_archived?
    super() || @silent
  end
end
