require_relative '../source'
require_relative '../item'

describe Source do
  context 'Should test movie class' do

    source = Source.new 'Mike'

    it 'source should be Source instantiation' do
      expect(source).to be_instance_of Source
    end

    it 'should return  correct source name' do
      expect(source.name).to eq 'Mike'
    end

    it 'has a name' do
      expect(source.name).to eq('Mike')
    end
  
    it 'has items' do
      expect(source.items).to eq([])
    end
  
    it 'can add items' do
      item = Item.new(Time.now, false)
      source.add_item(item)
      expect(source.items).to eq([item])
    end
  end
end