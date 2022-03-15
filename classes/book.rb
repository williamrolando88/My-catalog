require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state
  
  def initialize(publisher, cover_state)
    super()
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if self.can_be_archived? || cover_state == bad
    false
  end
end