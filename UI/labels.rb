require_relative '../classes/label'

class Labels

  attr_accessor :labels

  def initialize
    @labels = []
  end

  def list_labels
    @labels.each do |label|
      puts"Title: #{label.title} Color: #{label.color}"
    end
  end

  def create_label(title, color)
    new_label = Label.new(title: title, color: color)
    @labels << new_label 
    new_label
  end

  def convert_to_json
    @labels.map(&:to_hash)
  end
end
