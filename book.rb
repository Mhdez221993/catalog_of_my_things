require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(genre, author, source, label, publish_date, publisher, cover_state)
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    ''
  end

  def to_s
    "[Book]: publisher #{@publisher}, cover state #{@cover_state}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'publishere' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end
end
