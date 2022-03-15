require_relative '../classes/item'

describe 'Item class' do
  before :each do
    @item = Item.new('genre', 'author', 'source', 'label', '2022-03-04')
  end

  it 'should create a new item object' do
    expect(@item.class).to be Item
  end

  it 'can_be_archived? should return true' do
    expect(@item.can_be_archived?).to be false
  end

  it 'move_to_archive(item) should return true' do
    expect(Item.move_to_archive(@item)).to be false
  end
end
