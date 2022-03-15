require_relative 'paths'

describe 'Create rental instance' do
  context 'giving the following valid inputs' do
    it "name: 'Pop'" do
      example = Genre.new(name: 'Pop')
      expect(example).to be_instance_of Genre
      expect(example.name).to eq 'Pop'
    end
  end

  context 'and append the following items'
  it "album name: 'Pop'" do
    example = Genre.new(name: 'Pop')
    album1 = MusicAlbum.new(genre: 'Pop', on_spotify: true)
    example.add_album(album1)
    expect(example.items.size).to eq 1
    expect(album1.genre.name).to eq 'Pop'
  end
end
