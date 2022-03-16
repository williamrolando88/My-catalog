require_relative '../classes/book'

class Books
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_books
    @books.each do |book|
      puts"Genre: #{book.genre} Author: #{book.author} Source: #{book.source}"
    end
  end

  def add_book(genre, author, source, label, publish_date, publisher, cover_state)
    @books << Book.new(genre:genre, author:author, source:source, label: label, publish_date:publish_date, publisher:publisher, cover_state: cover_state )
  end

   def convert_to_json
    @books.map(&:to_hash)
  end
end