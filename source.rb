class Source
  attr_accessor :id
  attr_reader :name, :items

  def initialize(name = 'Unknown', id = number)
    @id = id or Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_s
    "[Source]: #{@name}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'source_id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'], object['source_id'])
  end
end
