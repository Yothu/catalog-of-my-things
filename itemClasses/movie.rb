require_relative 'item'
require_relative '../tagClasses/source'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date, silent, archived)
    super(publish_date, archived)
    @silent = silent
  end

  # private

  # def can_be_archived?
  #   super() || @silent
  # end
end

# ms = Movie.new('2019-04-03', true)
# puts ms.source
