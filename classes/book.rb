require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state
  
  def initialize(*args, publisher, cover_state)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.can_be_archived?(book)
    return true if Item.move_to_archive(book) || book.cover_state == 'bad'
    false
  end

  def self.path
    'data/book.json'
  end

  def self.read_file
    file_arr = []
    if Book.check_file
      JSON.parse(File.read(Book.path)).each do |element|
        file_arr << Book.new(element['genre'], element['author'], element['source'], element['publish_date'], element['id'], element['publisher'], element['cover_state'])
      end
    end
    file_arr
  end

  def self.write_file(data = [])
    file_arr = []
    data.each do |d|
      file_arr << { genre: d.genre, author: d.author, source: d.source, date: d.publish_date, id: d.id, publisher: d.publisher, cover_state: d.cover_state }
    end
    File.write(Book.path, JSON.generate(file_arr))
  end

  def self.check_file
    File.exist?(Book.path)
  end
end