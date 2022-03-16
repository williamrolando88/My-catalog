require 'json'

module FileStorage
  GENRES_FILE_PATH = './data/genres.json'.freeze
  MUSIC_ALBUMS_FILE_PATH = './data/music_albums.json'.freeze
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

  def save_genre(genres_container)
    File.new(GENRES_FILE_PATH, 'w') unless File.exist?(GENRES_FILE_PATH)
    genres_json = genres_container.convert_to_json
    File.write(GENRES_FILE_PATH, JSON.pretty_generate(genres_json))
  end

  def save_music_album(albums_container)
    File.new(MUSIC_ALBUMS_FILE_PATH, 'w') unless File.exist?(MUSIC_ALBUMS_FILE_PATH)
    albums_json = albums_container.convert_to_json
    File.write(MUSIC_ALBUMS_FILE_PATH, JSON.pretty_generate(albums_json))
  end

  def parse_genre(genre_json)
    return if genre_json.empty?

    JSON.parse(genre_json).each do |genre|
      @genres.add_genre(name: genre['name'], id: genre['id'])
    end
  end

  def parse_music_album(music_album_json)
    return if music_album_json.empty?

    JSON.parse(music_album_json).each do |album|
      genre = @genres.genres_by_id(album['genre'])
      @albums.add_album(author: album['author'],
                        source: album['source'],
                        label: album['label'],
                        publish_date: album['publish_date'],
                        on_spotify: album['on_spotify'],
                        id: album['id'],
                        genre: genre)
    end
  end
end
