class Label
  attr_reader :id, :genre, :author, :source, :label, :publish_date
  
  def initialize
     @id = rand(1..1000)
     @title = title
     @color = color
     @items = []
  end

  def self.add_item(item)
    LabelItems.new(item, self)
  end
end