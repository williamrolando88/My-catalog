require_relative 'paths'

describe 'Create genre instance' do
  context 'giving the following valid inputs' do
    it "name: 'Pop'" do
      example = Genre.new(name: 'Pop')
      expect(example).to be_instance_of Genre
      expect(example.name).to eq 'Pop'
    end
    it "name: 'Rock'" do
      example = Genre.new(name: 'Rock')
      expect(example).to be_instance_of Genre
      expect(example.name).to eq 'Rock'
    end
  end
  
  context 'and append the following items' do
    it "album name: 'Pop'" do
      pop = Genre.new(name: 'Pop')
      album = MusicAlbum.new(genre: pop, on_spotify: true)
      expect(pop.items.size).to eq 1
      expect(album.genre.name).to eq 'Pop'
    end
  end
end
