require_relative 'item'

class Book < Item
  attr_accessor :id
  attr_reader :publisher, :cover_state

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, publisher, cover_state)
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    super && (cover_stateinclude? 'bad')
  end

  def to_s
    "[Book]: #{super}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'genre' => @genre.id,
      'author' => @author.id,
      'source' => @source.id,
      'label' => @label.id,
      'publish_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end
end
