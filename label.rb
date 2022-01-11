class Source
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
end
