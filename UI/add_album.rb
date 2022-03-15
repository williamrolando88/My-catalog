module AddAlbum
  def request_author
    print 'Author: '
    author = gets.chomp
    while author.empty?
      print 'Please type a valid author: '
      author = gets.chomp
    end
    author
  end

  def request_genre
    puts 'Select a genre: '
    @genres.genres_short
    handle_request_genre
  end

  def handle_request_genre
    input = gets.chomp.upcase
    return @genres.add_genre if input == 'C'

    id = input.to_i
    genre = @genres.genres_by_id(id)
    until genre
      print 'Please type a valid ID: '
      id = gets.chomp.to_i
      genre = @genres.genres_by_id(id)
    end
    genre
  end

  def request_source
    print 'Source [optional]: '
    gets.chomp
  end

  def request_label
    print 'Label [optional]: '
    gets.chomp
  end

  def request_publish_date
    print 'Publish date (dd/mm/yyyy): '
    publish_date = gets.chomp
    day, month, year = publish_date.split('/')
    until Date.valid_date?(year.to_i, month.to_i, day.to_i)
      print 'Please type a valid publish date (dd/mm/yyyy): '
      publish_date = gets.chomp
      day, month, year = publish_date.split('/')
    end
    publish_date
  end

  def request_on_spotify
    print 'Is on Spotify? [Y/N]: '
    on_spotify = gets.chomp.upcase
    until on_spotify.match(/Y|N/)
      print 'Please chose a valid option, is on Spotify? [Y/N]: '
      on_spotify = gets.chomp.upcase
    end

    if on_spotify == 'Y'
      true
    else
      false
    end
  end
end
