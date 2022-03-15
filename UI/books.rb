require_relative '../classes/book'
require_relative '../classes/label'
require_relative 'labels'

class Books
  attr_accessor :book

  def initialize
    @books = []
  end

  def list_books
  end

  def add_book(genre, author, source, label, publish_date, publisher, cover_state)
    @books = Book.new(genre:genre, author:author, source:source, label: label, publish_date:publish_date, publisher:publisher, cover_state: cover_state )
  end
end