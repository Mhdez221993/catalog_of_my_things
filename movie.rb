require_relative 'item'

class Movie < Item
  attr_reader :silent

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, silent)
    super(genre, author, source, label, publish_date)
    @silent = silent
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    super or silent
  end

  def to_s
    "[Movie]: #{super}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'genre' => @genre.id,
      'author' => @author.id,
      'source' => @source.id,
      'label' => @label.id,
      'silent' => @silent
    }.to_json(*args)
  end
end
