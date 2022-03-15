require_relative '../classes/book'
require_relative '../classes/label'

class Labels

  attr_accessor :label

  def initialize
    @labels = []
  end

  def create_label(title, color)
    new_label = Label.new(title: title, color: color)
    @labels << new_label 
    new_label
  end
end
