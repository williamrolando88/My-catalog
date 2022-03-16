require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state
  
  def initialize(publisher:, cover_state:, **args )
    super(**args)
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

  def to_hash
    {
      'type' => self.class,
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'source' => @source,
      'label' => @label.id,
      'publish_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }
  end
end