require_relative '../classes/book'
require_relative '../classes/label'
require_relative 'books'
require_relative 'labels'
require_relative 'helpers'
require_relative 'file_storage'

class App
  include Helpers
  include FileStorage

  attr_accessor :book, :labels, :books

  def initialize
    @music_albums = []
    @labels = Labels.new
    @books = Books.new
  end

  def add_label
    title = request_title
    color = request_color
    label = @labels.create_label(title,color)
    label
  end

  def add_book
    label = add_label
    genre = request_genre
    author = request_author
    source = request_source
    publish_date = request_date
    publisher = request_publish
    cover_state = request_cover
    book = @books.add_book(genre,author,source, label, publish_date, publisher, cover_state)
  end

  def list_books
    restore_book
    @books.list_books
  end

  def list_labels
    restore_labels if @labels.labels.length == 0
    @labels.list_labels
  end

  def save_data
    save_label(@labels) unless @labels.labels.empty?
    save_book(@books) unless @books.books.empty?
  end

  def restore_labels
    parse_label(File.read(LABELS_FILE_PATH)) if File.exist?(LABELS_FILE_PATH)
  end

  def restore_books
    parse_book(File.read(BOOKS_FILE_PATH)) if File.exist?(BOOKS_FILE_PATH)
  end
end
