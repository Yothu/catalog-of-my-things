require_relative '../genre'

describe Genre do
  before(:each) { @genre = Genre.new('Rock') }

  it 'has a name' do
    expect(@genre.name).to eq('Rock')
  end

  it 'has items' do
    expect(@genre.items).to eq([])
  end

  it 'can add items' do
    item = Item.new(Time.now, false)
    @genre.add_item(item)
    expect(@genre.items).to eq([item])
  end
end
