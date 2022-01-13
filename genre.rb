class Genre
  attr_accessor :id
  attr_reader :name, :items

  def initialize(name = 'Unknown', id = Random.rand(1...1000))
    @id = id
    @name = name
    @items = []
  end

  
end