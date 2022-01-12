require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, on_spotify)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    super() && @on_spotify
  end

  def to_s
    "[Music Album]: #{super}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'genre' => @genre.id,
      'author' => @author.id,
      'source' => @source.id,
      'label' => @label.id,
      'on_spotify' => @on_spotify
    }.to_json(*args)
  end
end
