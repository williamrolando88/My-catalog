require_relative '../classes/genre'

class Genres
  def initialize
    @genres = []
    @genres << Genre.new(name: 'Pop')
    @genres << Genre.new(name: 'Jazz')
  end

  def genres
    puts "Genre: "
    puts 'EMPTY' if @genres.empty?
    puts(@genres.map { |genre| "Genre: #{genre.name}, Number of albums: #{genre.items.length}" })
  end
  
end