class LabelItems
  attr_accessor :item, :label

  def initialize(item, label)
    @item = item
    item.label << self
    @label = label
    label.items << self
  end
end