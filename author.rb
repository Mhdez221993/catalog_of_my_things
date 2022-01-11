class Author
  attr_accessor :id
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1...0)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
