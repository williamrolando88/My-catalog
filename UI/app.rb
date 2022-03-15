require_relative '../classes/book'
require_relative '../classes/label'
require_relative 'books'
require_relative 'labels'
require_relative 'helpers'

class App
  include Helpers

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
    @books.list_books
  end
end
