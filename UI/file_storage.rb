require 'json'

module FileStorage
  LABELS_FILE_PATH = './data/labels.json'.freeze
  BOOKS_FILE_PATH = './data/books.json'.freeze

  def save_label(labels)
    File.new(LABELS_FILE_PATH, 'w') unless File.exist?(LABELS_FILE_PATH)
    labels_json = labels.convert_to_json
    File.write(LABELS_FILE_PATH, JSON.pretty_generate(labels_json))
  end

  def save_book(books)
    File.new(BOOKS_FILE_PATH, 'w') unless File.exist?(BOOKS_FILE_PATH)
    books_json = books.convert_to_json
    File.write(BOOKS_FILE_PATH, JSON.pretty_generate(books_json))
  end
end


