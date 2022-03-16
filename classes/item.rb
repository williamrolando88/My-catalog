require_relative './label'
require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :publish_date
  attr_accessor :archived, :label

  def initialize(label:, publish_date:, genre: 'Unknown', author: 'Unknown', source: 'Unknown', id: rand(1..1000))
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    label.add_item(self)
    @publish_date = Date.parse(publish_date.to_s)
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
