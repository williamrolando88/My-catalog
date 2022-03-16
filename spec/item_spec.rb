require_relative '../classes/item'
require_relative '../classes/label'

describe 'Item class' do
  before :each do
    @label = Label.new(title: 'gift', color: 'red')
    @item = Item.new(genre: 'genre', author: 'author', source: 'source', label: @label, publish_date: '1922-03-04')
  end

  it 'object class should be Item' do
    expect(@item.class).to be Item
  end

  it 'can_be_archived? should return false' do
    expect(@item.archived).to be false
  end

  it 'move_to_archive(item) should return true' do
    expect(@item.move_to_archive).to be true
  end

  it 'add_label should insert label to Item & Label class' do
    expect(@item.label.class).to be Label
  end
end
