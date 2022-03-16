class Genre
  attr_reader :name, :items, :id

  def initialize(name:, id: rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_album(item)
    return if @items.include?(item)

    @items << item
    item.genre = self
  end

  def to_hash
    {
      'type' => self.class,
      'id' => @id,
      'name' => @name
    }
  end
end
