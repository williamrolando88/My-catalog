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
    gets.chomp
  end

  def request_color
    puts 'Label color:'
    gets.chomp
  end

  def request_genre
    puts 'Genre:'
    gets.chomp
  end

  def request_author
    puts 'Author:'
    gets.chomp
  end

  def request_source
    puts 'Source:'
    gets.chomp
  end

  def request_date
    puts 'Date(YYYY-MM-DD):'
    gets.chomp
  end

  def request_publish
    puts 'Publisher:'
    gets.chomp
  end

  def request_cover
    puts 'Cover State:'
    gets.chomp
  end
end
