class Genre
  attr_reader :name, :items
  def initialize(id: rand(1..1000), name:)
    @id = id
    @name = name
    @items = []
  end

  def add_album(item)
    return if @items.include?(item)

    @items << item
    item.set_genre(self)
  end
  
end