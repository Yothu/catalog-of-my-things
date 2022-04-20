require_relative '../music_album'

describe MusicAlbum do
  before(:each) do
    @genre = Genre.new('Rock')
    @item = Item.new(Time.now, false)
    @genre.add_item(@item)
    @album = MusicAlbum.new(true, Time.new(2020, 10, 10), false)
  end

  it 'has a publish date' do
    expect(@album.publish_date).to eq(Time.new(2020, 10, 10))
  end

  it 'has an archived status' do
    expect(@album.archived).to eq(false)
  end

  it 'can be archived should return true if parent method returns true AND if on_spotify equals true' do
    expect(@album.can_be_archived?).to eq(false)
  end

  it 'can be moved to archive' do
    @album.move_to_archive
    expect(@album.archived).to eq(false)
  end
end
