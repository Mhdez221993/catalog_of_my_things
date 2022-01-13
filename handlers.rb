module Handlers
  def list_item(my_items, my_class)
    my_items.each { |item| puts item if item.instance_of?(my_class) }
  end

  def add_genre
    puts "Lets's add a genre"
    print 'Name: '
    name = gets.chomp
    Genre.new(name)
  end

end