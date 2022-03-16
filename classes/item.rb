require_relative './label'
require 'date'

class Item
  attr_accessor :archived, :genre, :label
  attr_reader :author, :source, :publish_date, :id

  def initialize(id: rand(1..1000), genre: 'Unknown', author: 'Unknown', source: 'Unknown', label: 'Unknown',
                 publish_date: Date.today.to_s)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date.to_s)
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
    @archived
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    return true if (current_year - @publish_date.year) > 10

    false
  end
end
