module Add_album

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
    print 'Genre: '
    genre = gets.chomp.upcase
    while genre.empty?
      print 'Please type a valid genre: '
      genre = gets.chomp
    end
    genre
  end

  def request_source
    print 'Source [optional]: '
    source = gets.chomp
    source
  end

  def request_label
    print 'Label [optional]: '
    label = gets.chomp
    label
  end

  def request_publish_date
    print 'Publish date (dd/mm/yyyy): '
    publish_date= gets.chomp
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