require_relative '../classes/music_album'

class Albums

  def initialize
    @albums = []
    @albums << MusicAlbum.new(on_spotify: true, genre: 'Pop')
    @albums << MusicAlbum.new(on_spotify: true, genre: 'Jazz')
  end

  def add_album(author, genre, source, label, publish_date, on_spotify)
    album = MusicAlbum.new(on_spotify: on_spotify, genre: genre, author: author, source: source, publish_date: publish_date, label: label)
    @albums << album
  end

  def albums
    puts "Albums: "
    puts 'EMPTY' if @albums.empty?
    puts(@albums.map { |album| "Genre: #{album.genre}, Author: #{album.author}, Is on Spotify?: #{album.on_spotify}, Publish date: #{album.publish_date}"})
  end
  
end