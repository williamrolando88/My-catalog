class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title:, color:, id: rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.label = self
  end

  def to_hash
    {
      'type' => self.class,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }
  end
end
