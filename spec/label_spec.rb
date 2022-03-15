require_relative '../classes/item'
require_relative '../classes/label'

describe 'Label class' do
  before :each do
    @label = Label.new(title: 'new', color: 'blue')
    @item = Item.new(genre:'genre', author:'author', source: 'source', label:@label, publish_date:'2022-03-04')
  end

  it 'object class should be Label' do
    expect(@label.class).to be Label
  end

  it 'add_item should insert item to Label & Item class' do
    @label.add_item(@item)
    expect(@item.label.class).to be Label
  end
end
