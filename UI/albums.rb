require_relative '../classes/music_album'
require_relative '../classes/genre'

class Albums
  def initialize
    @albums = []
  end

  def add_album(author, genre, source, label, publish_date, on_spotify)
    album = MusicAlbum.new(on_spotify: on_spotify, genre: genre, author: author, source: source,
                           publish_date: publish_date, label: label)
    @albums << album
  end

  def albums
    puts 'Albums: '
    puts 'EMPTY' if @albums.empty?
    puts(@albums.map do |album|
           "Genre: #{album.genre.name}, Author: #{album.author}, Is on Spotify?: #{album.on_spotify},
           Publish date: #{album.publish_date}"
         end)
  end
end
