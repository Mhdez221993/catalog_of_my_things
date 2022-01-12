require_relative 'item'

class Movie < Item
  attr_reader :silent

  def initialize(genre, author, source, label, publish_date, silent)
    super(genre, author, source, label, publish_date)
    @silent = silent
  end

  def can_be_archived?
    ''
  end

  def to_s
    "[Movie]: silent #{@silent}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'silent' => @silent
    }.to_json(*args)
  end
end
