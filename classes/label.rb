class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title, color)
     @id = rand(1..1000)
     @title = title
     @color = color
     @items = []
  end

  def self.add_item(item, label)
    LabelItems.new(item, label)
  end
end