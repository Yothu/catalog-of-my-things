require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date, silent)
    super(publish_date)
    @silent = silent
  end

  # private

  # def can_be_archived?
  #   super() || @silent
  # end
end

# ms = Movie.new('2019-04-03', true)
# puts ms.source
