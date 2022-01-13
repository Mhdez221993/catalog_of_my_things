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

  def add_source
    puts "Lets's add a source"
    print 'Name: '
    name = gets.chomp
    Source.new(name)
  end

  def add_author
    puts "Lets's add an author"
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def add_label
    puts "Lets's add a label"
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def select_items(items, name)
    puts "Please select a #{name} by number"
    items.each_with_index { |item, i| puts "#{i}) #{item}" }
    items[gets.chomp.to_i]
  end

  def create_item
    genre = select_items(@genres, 'genre')
    author = select_items(@authors, 'author')
    source = select_items(@sources, 'source')
    label = select_items(@labels, 'label')
    [genre, author, source, label]
  end

  def add_book
    puts "Let's add a book"
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state [good/bad]: '
    cover_state = gets.chomp
    print 'Date: '
    publish_date = gets.chomp
    items = create_item
    Book.new(*items, publish_date, publisher, cover_state)
  end

  def add_misic_album
    print 'Is this album on spotify [Y/N]: '
    on_spotify = gets.chomp == 'y'
    print 'Date: '
    publish_date = gets.chomp
    items = create_item
    MusicAlbum.new(*items, publish_date, on_spotify)
  end

  def add_movie
    print 'Is silent [y/n]: '
    silent = gets.chomp == 'y'
    print 'Date: '
    publish_date = gets.chomp
    items = create_item
    Movie.new(*items, publish_date, silent)
  end

  def add_game
    print 'Is a multiplayer game [y/n]: '
    multiplayer = gets.chomp == 'y'
    print 'Last played at: '
    last_play_at = gets.chomp
    print 'Date: '
    publish_date = gets.chomp
    items = create_item
    Game.new(*items, publish_date, multiplayer, last_play_at)
  end
end