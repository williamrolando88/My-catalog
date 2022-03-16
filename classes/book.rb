require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(publisher:, cover_state:, label:, **args)
    super(label: label, **args)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
    label.add_item(self)
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
