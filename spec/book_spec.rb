require_relative '../classes/book'

describe 'Book class' do
  before :each do
    @book = Book.new('genre', 'author', 'source', '2022-03-04','Penguin', 'bad' )
    @book2 = Book.new('genre', 'author', 'source', '2022-03-04','Penguin', 'good' )
  end

  it 'object class should be Book' do
    expect(@book.class).to be Book
  end

  it 'can_be_archived? should return true' do
    expect(Book.can_be_archived?(@book)).to be true
  end

  it 'can_be_archived? should return false' do
    expect(Book.can_be_archived?(@book2)).to be false
  end
end