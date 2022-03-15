require_relative 'paths'

describe 'Create music_album instance' do
  context 'giving the following valid inputs' do
    it "genre: 'Pop', on_spotify: false" do
      pop = Genre.new(name: 'Pop')
      album = MusicAlbum.new(genre: pop, on_spotify: false)
      expect(album).to be_instance_of MusicAlbum
      expect(album.genre.name).to eq 'Pop'
      expect(album.on_spotify).to eq false
    end
    it "genre: 'Pop', on_spotify: true" do
      pop = Genre.new(name: 'Pop')
      album = MusicAlbum.new(genre: pop, on_spotify: true)
      expect(album.genre.name).to eq 'Pop'
      expect(album.on_spotify).to eq true
    end
    it "genre: 'Jazz', on_spotify: true" do
      jazz = Genre.new(name: 'Jazz')
      album = MusicAlbum.new(genre: jazz, on_spotify: true)
      expect(album.genre.name).to eq 'Jazz'
      expect(album.on_spotify).to eq true
      expect(album.archived).to be false
    end
  end
end
