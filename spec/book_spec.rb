require_relative '../book'

describe Book do
  before :each do
    @book = Book.new(Time.new(2022, 1, 1), true, 'Reem', 'Good')
  end

  describe '#new' do
    it 'takes four parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#publish' do
    it 'returns the correct publisher name' do
      @book.publisher.should eql 'Reem'
    end
  end

  describe '#cover_state' do
    it 'returns the correct Cover_state' do
      @book.cover_state.should eql 'Good'
    end
  end

  describe 'Check if the book can be archived'
  it 'Return true if can be archived or cover state is bad otherwise return false' do
    expect(@book.can_be_archived?).to eql false
  end
end
