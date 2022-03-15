require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date
  attr_accessor :archived

  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..1000)
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

  def self.add_item(item)
    LabelItems.new(item, self)
  end
end
