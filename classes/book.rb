require_relative 'item'

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
end