require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(genre, author, source, label, publish_date, on_spotify)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super() && @on_spotify
  end

  def to_s
    "[Music Album]: on spotify #{@on_spotify}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'on_spotify' => @on_spotify
    }.to_json(*args)
  end
end
