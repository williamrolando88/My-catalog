require_relative '../classes/book'
require 'json'

describe 'Book class' do
  before :each do
    @label = Label.new(title: 'gift', color: 'red')
    @book = Book.new(genre: 'genre', author: 'author', source: 'source', label: @label, publish_date: '2022-03-04',
                     publisher: 'Penguin', cover_state: 'bad')
    @book2 = Book.new(genre: 'genre', author: 'author', source: 'source', label: @label, publish_date: '2022-03-04',
                      publisher: 'Penguin', cover_state: 'good')
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
