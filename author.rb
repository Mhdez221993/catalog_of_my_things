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

  def to_s
    "First name: #{@first_name}, Last name: #{@last_name}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'author_id' => @id,
      'first_name' => @first_name,
      'last_name' => @first_namel
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['first_name'], object['last_name'])
  end
end
