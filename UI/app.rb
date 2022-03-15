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

  def self.input
    gets.chomp
  end

  def self.book
    { genre: genre, author: author, source: source, publish_date: publish_date, publisher: publisher, cover_state: cover_state }
  end

  def book_menu
    puts 'Genre:'
    #@book.genre = App.input
    puts 'Author:'
    #@book.author = App.input
    puts 'Source:'
    #@book.source = App.input
    puts 'Date(YYYY-MM-DD):'
    #@book.date = App.input
    puts 'Publisher:'
    #@book.publisher = App.input
    puts 'Cover State:'
    #@book.cover_state = App.input
  end

  def add_book
    App.book
    #Book.new(@book.genre, @book.author, @book.source, @book.date, @book.publisher, @book.cover_state)
  end
end
