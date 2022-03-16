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

  def parse_label(labels_json)
    return if labels_json.empty?

    JSON.parse(labels_json).each do |label|
      @labels.restore_label_with_id(label['id'], label['title'], label['color'])
    end
  end

  def parse_book(books_json)
    return if books_json.empty?

    JSON.parse(books_json).each do |book|
      label = @labels.find_label_by_id(book['label'])

      @books.add_book(book['genre'],
                      book['author'],
                      book['source'],
                      label[0],
                      book['publish_date'],
                      book['publisher'],
                      book['cover_state'])
    end
  end
end
