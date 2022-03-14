require 'date'

class Item
  attr_accessor :archived

  def initialize(genre, author, source, label, publish_date)
    @id = rand(8..100)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def can_be_archived?
   current_year = Date.today.year
   return true if (current_year - @publish_date.year) > 10
   false
  end

  def self.move_to_archive(item)
    item.archived = true if item.can_be_archived?
    item.archived
  end
end

item = Item.new('genre', 'author', 'source', 'label', '2022-03-04')
p(item)
p(item.can_be_archived?)
p(Item.move_to_archive(item))