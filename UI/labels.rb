require_relative '../classes/label'

class Labels
  attr_accessor :labels

  def initialize
    @labels = []
  end

  def list_labels
    @labels.each do |label|
      puts "Title: #{label.title} Color: #{label.color}"
    end
  end

  def create_label(title, color)
    new_label = Label.new(title: title, color: color)
    @labels << new_label
    new_label
  end

  def restore_label_with_id(label_id, title, color)
    new_label = Label.new(id: label_id, title: title, color: color)
    @labels << new_label
    new_label
  end

  def find_label_by_id(label_id)
    @labels.each do |label_object|
      label_object if label_object.id == label_id
    end
  end

  def convert_to_json
    @labels.map(&:to_hash)
  end
end
