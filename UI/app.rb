require_relative '../classes/book'

class App
  def initialize
    @books = Book.read_file
    @music_albums = []
  end

  def list_books
    @books.each_with_index do |item, index|
      puts "#{index + 1}, book_title, #{item.author}"
    end
  end
end
