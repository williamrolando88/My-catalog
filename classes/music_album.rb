require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify:, genre:, **options)
    @on_spotify = on_spotify
    genre.items.push(self)
    super(genre: genre, **options)
  end
  
    def to_json
      {
        type: self.class,
        id: @id,
        author: @author,
        source: @source,
        label: @label,
        genre: @genre.id,
        publish_date: @publish_date,
        archived: @archived
      }.to_json
    end

  private

  def can_be_archived?
    current_year = Date.today.year
    return true if (current_year - @publish_date.year) > 10 && @on_spotify

    false
  end
end
