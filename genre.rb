class Genre
  attr_accessor :id
  attr_reader :name

  def initialize(name = 'Unknown')
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_s
    "Genre: #{@name}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'genre_id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'])
  end
end
