require 'date'

class Item
  attr_accessor :archived
  attr_reader :genre, :author, :source, :label, :publish_date

  def initialize(id: rand(1..1000), genre: 'Unknown', author: 'Unknown', source: 'Unknown', label: 'Unknown', publish_date: Date.today.to_s)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def self.move_to_archive(item)
    item.archived = true if item.can_be_archived?
    item.archived
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    return true if (current_year - @publish_date.year) > 10

    false
  end
end
