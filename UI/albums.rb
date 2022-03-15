require_relative '../classes/music_album'
require_relative '../classes/genre'

class Albums
  attr_reader :albums

  def initialize
    @albums = []
  end

  def add_album(author:, genre:, source:, label:, publish_date:, on_spotify:, **options)
    album = MusicAlbum.new(on_spotify: on_spotify, genre: genre, author: author, source: source,
                           publish_date: publish_date, label: label, **options)
    @albums << album
  end

  def show_albums
    puts 'Albums list: '
    puts 'EMPTY' if @albums.empty?
    puts(@albums.map do |album|
           "Author: #{album.author}, Genre: #{album.genre.name}, Is on Spotify?: #{album.on_spotify}, Publish date: #{album.publish_date}"
         end)
  end

  def convert_to_json
    @albums.map {|album| album.to_hash}
  end
end
