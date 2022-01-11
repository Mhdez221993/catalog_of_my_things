class Source
  attr_accessor :id
  attr_reader :name

  def initialize(name)
    @id = Random.rand(1...0)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
