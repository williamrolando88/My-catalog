require_relative 'albums'
require_relative 'genres'
require_relative 'add_album'
require_relative 'file_storage'

class App
  include AddAlbum
  include FileStorage
  attr_reader :albums, :genres

  def initialize
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
    @albums.add_album(author: author, genre:genre, source:source, label:label, publish_date:publish_date, on_spotify:on_spotify)
  end

  def save_data
    save_genre(@genres) unless @genres.genres.empty?
    save_music_album(@albums) unless @albums.albums.empty?
  end

  def restore_data
    parse_genre(File.read(GENRES_FILE_PATH)) if File.exist?(GENRES_FILE_PATH)
    parse_music_album(File.read(MUSIC_ALBUMS_FILE_PATH)) if File.exist?(MUSIC_ALBUMS_FILE_PATH)
  end  
end
