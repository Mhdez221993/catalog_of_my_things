require 'date'

class Item
  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1...1000)
    @genre = genre
    genre.items << self

    @author = author
    author.items << self

    @source = source
    source.items << self

    @label = label
    label.items << self

    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    now = DateTime.now.next_year(-10).to_time
    oldate = Date.parse(@publish_date).to_time

    oldate <= now
  end

  def move_to_archived
    @archived = can_be_archived?
  end
end
