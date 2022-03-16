require_relative '../classes/book'
require_relative '../classes/label'
require_relative 'books'
require_relative 'labels'
require_relative 'helpers'
require_relative 'albums'
require_relative 'genres'
require_relative 'add_album'
require_relative 'file_storage'


class App
  include AddAlbum
  include Helpers
  include FileStorage

  attr_reader :albums, :genres
  attr_accessor :book, :labels, :books

  def initialize
    @albums = Albums.new
    @genres = Genres.new
    @labels = Labels.new
    @books = Books.new
  end

  def add_album
    author = request_author_album
    genre = request_genre_album
    source = request_source_album
    label = request_label
    publish_date = request_publish_date
    on_spotify = request_on_spotify
    @albums.add_album(author: author, genre: genre, source: source, label: label, publish_date: publish_date, on_spotify: on_spotify)
    puts "#{author}, #{genre.name} album successfully created!"
  end

  def add_label
    title = request_title
    color = request_color
    @labels.create_label(title, color)
  end

  def add_book
    label = add_label
    genre = request_genre
    author = request_author
    source = request_source
    publish_date = request_date
    publisher = request_publish
    cover_state = request_cover
    @books.add_book(genre, author, source, label, publish_date, publisher, cover_state)
  end

  def list_books
    restore_data if @books.books.length.zero?
    @books.list_books
  end

  def list_labels
    restore_data if @labels.labels.length.zero?
    @labels.list_labels
  end

  def save_data
    save_label(@labels) unless @labels.labels.empty?
    save_book(@books) unless @books.books.empty?
    save_genre(@genres) unless @genres.genres.empty?
    save_music_album(@albums) unless @albums.albums.empty?
  end

  def restore_data
    parse_label(File.read(LABELS_FILE_PATH)) if File.exist?(LABELS_FILE_PATH)
    parse_book(File.read(BOOKS_FILE_PATH)) if File.exist?(BOOKS_FILE_PATH)
    parse_genre(File.read(GENRES_FILE_PATH)) if File.exist?(GENRES_FILE_PATH)
    parse_music_album(File.read(MUSIC_ALBUMS_FILE_PATH)) if File.exist?(MUSIC_ALBUMS_FILE_PATH)
  end
end
