require 'os'

module Helpers
  def continue
    puts 'Press ENTER key to continue...'
    gets
  end

  def clear_screen
    system('cls') if OS.windows?
    system('clear') if OS.posix?
  end

  def request_title
    puts 'Label title:'
    title = gets.chomp
    title
  end

  def request_color
    puts 'Label color:'
    color = gets.chomp
    color
  end

  def request_genre
      puts 'Genre:'
      genre = gets.chomp
  end

  def request_author
    puts 'Author:'
    author = gets.chomp
  end

  def request_source
    puts 'Source:'
    source = gets.chomp
  end

  def request_date
    puts 'Date(YYYY-MM-DD):'
      date = gets.chomp
  end
      
  def request_publish
    puts 'Publisher:'
    publish = gets.chomp
  end

  def request_cover
    puts 'Cover State:'
    cover = gets.chomp
  end
end
