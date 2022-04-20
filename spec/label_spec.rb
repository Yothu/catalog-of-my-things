require_relative '../label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new 'Comedy', 'Red'
  end

  describe '#new' do
    it 'takes two parameters and returns a Label object' do
      @label.should be_an_instance_of Label
    end
  end

  describe '#Title' do
    it 'returns the correct title' do
      @label.title.should eql 'Comedy'
    end
  end

  describe '#Color' do
    it 'returns the correct color' do
      @label.color.should eql 'Red'
    end
  end

  describe 'Add items to label'
  it 'Push a new item in Each label class object' do
    item = Item.new(Time.new(2010, 1, 1), true)
    @label.add_items(item)

    expect(@label.items).to include(item)
  end
end
