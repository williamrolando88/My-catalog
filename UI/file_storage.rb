require 'json'

module FileStorage
  GENRES_FILE_PATH = './data/genres.json'.freeze
  MUSIC_ALBUMS_FILE_PATH = './data/music_albums.json'.freeze

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
