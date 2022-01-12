class Label
  attr_accessor :id
  attr_reader :title, :color

  def initialize(title = 'Unknown', color = 'Unknown')
    @id = Random.rand(1...0)
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
    new(object['title'], object['color'])
  end
end
