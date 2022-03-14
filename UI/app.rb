require_relative 'albums'
require_relative 'genres'
require_relative 'add_album'

class App
  include Add_album
  attr_reader :albums, :genres
  def initialize
    @books = []
    @albums = Albums.new
    @genres = Genres.new
  end

  def add_album
    author = request_author
    genre = request_genre
    source = request_source
    label = request_label
    publish_date = request_publish_date
    on_spotify = request_on_spotify
    @albums.add_album(author, genre, source, label, publish_date, on_spotify)

  end

  
end
