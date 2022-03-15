require_relative '../classes/item'
require_relative '../classes/label'
require_relative '../classes/label_items'

describe 'Item class' do
  before :each do
    @item = Item.new('genre', 'author', 'source', '2022-03-04')
    @label = Label.new('gift', 'red')
  end

  it 'object class should be Item' do
    expect(@item.class).to be Item
  end

  it 'can_be_archived? should return false' do
    expect(@item.can_be_archived?).to be false
  end

  it 'move_to_archive(item) should return false' do
    expect(Item.move_to_archive(@item)).to be false
  end

  it 'add_label should insert label to item & Label class' do
    Item.add_label(@item, @label)
    expect(@item.label.length).to eq 1
  end
end
