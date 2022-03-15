require 'json'

module FileStorage
  GENRES_FILE_PATH = './data/genres.json'.freeze
  MUSIC_ALBUMS_FILE_PATH = './data/music_albums.json'.freeze
  
  def save_genre(genres_container)
    File.new(GENRES_FILE_PATH, 'w') unless File.exist?(GENRES_FILE_PATH)
    genres_json = genres_container.convert_to_json
    File.write(GENRES_FILE_PATH, JSON.generate(genres_json))
  end
  
  def save_music_album(albums_container)
    File.new(MUSIC_ALBUMS_FILE_PATH, 'w') unless File.exist?(MUSIC_ALBUMS_FILE_PATH)
    albums_json = albums_container.convert_to_json
    File.write(MUSIC_ALBUMS_FILE_PATH, JSON.generate(albums_json))
  end
  

end