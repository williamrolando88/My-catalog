require_relative '../classes/genre'

class Genres
  attr_reader :genres

  def initialize
    @genres = []
  end

  def add_genre(name:, id:)
    @genres << Genre.new(name: name, id: id)
  end

  def add_genre_by_user
    print 'Type a the new genre name: '
    input = gets.chomp.capitalize
    while input.empty?
      print 'Name can\'t be empty, please type a the valid name: '
      input = gets.chomp.capitalize
    end
    new_genre = Genre.new(name: input)
    @genres << new_genre
    puts "Genre \"#{new_genre.name}\" successfully created"
    new_genre
  end

  def genres_extended
    puts 'Genres list: '
    puts 'EMPTY' if @genres.empty?
    puts(@genres.map { |genre| "Genre: #{genre.name}, Number of albums: #{genre.items.length}" })
  end

  def genres_short
    if @genres.empty?
      print 'No available genres, (C)reate a new one: '
    else
      puts(@genres.map { |genre| "ID:#{genre.id}, Genre: #{genre.name}" })
      print 'Type the ID of one of the available genres or (C)reate a new one: '
    end
  end

  def genres_by_id(id)
    element = @genres.select { |genre| genre.id == id }
    return false if element.empty?

    element.first
  end

  def convert_to_json
    @genres.map(&:to_hash)
  end
end
