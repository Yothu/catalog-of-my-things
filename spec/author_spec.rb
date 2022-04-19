require_relative '../author'
require_relative '../item'

describe Author do
  author = Author.new('Rames', 'Jaynor')
  describe '#initialize' do
    it 'should create a new Author' do
      expect(author).to be_a Author
    end

    it 'the new Author\'s first name should be Rames' do
      expect(author.first_name).to eq('Rames')
    end

    it 'the new Author\'s last name should be Jaynor' do
      expect(author.last_name).to eq('Jaynor')
    end
  end

  describe '#add_item' do
    it 'should add an item to the items array' do
      item = Item.new(Time.new(2000, 1, 1), true)

      author.add_item(item)

      expect(author.items.length).to eq(1)
    end
  end
end
