class Label
  attr_accessor :id
  attr_reader :title, :color, :items

  def initialize(title = 'Unknown', color = 'Unknown', id = number)
    @id = id or Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_s
    "[Label]: Title #{@title}, Color #{@color}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'lable_id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['title'], object['color'], object['lable_id'])
  end
end
