require_relative '../movie'

describe Movie do
  context 'Should test movie class' do
    movie = Movie.new 'The Movie', '2020/02/02', true, true

    it 'movie should be Movie instantiation' do
      expect(movie).to be_instance_of Movie
    end

    it 'should return  correct silent status' do
      expect(movie.silent).to eq true
    end

    it 'should return correct date' do
      expect(movie.publish_date).to eq '2020/02/02'
    end

    it 'has an archived status' do
      expect(movie.archived).to eq(true)
    end
  end
end
