require_relative '../classes/item'
require_relative '../classes/label'
require_relative '../classes/label_items'

describe 'Label class' do
  before :each do
    @item = Item.new('genre', 'author', 'source', '2022-03-04')
    @label = Label.new('new', 'blue')
  end

  it 'object class should be Label' do
    expect(@label.class).to be Label
  end

  it 'add_item should insert item to Label & Item class' do
    Label.add_item(@item, @label)
    expect(@item.label.length).to eq 1
  end
end