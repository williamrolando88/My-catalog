class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title, color)
     @id = rand(1..1000)
     @title = title
     @color = color
     @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.label = self
  end
end