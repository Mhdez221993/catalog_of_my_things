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

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    print 'Date: '
    publish_date = gets.chomp
    items = find_items
    Book.new(*items, publish_date, publisher, cover_state)
  end

  def add_misic_album
    print 'Is this album in spotify [Y/N]: '
    on_spotify = gets.chomp == 'y'
    print 'Date: '
    publish_date = gets.chomp
    items = find_items
    MusicAlbum.new(*items, publish_date, on_spotify)
  end

  def add_movie
    print 'Is silent: '
    silent = gets.chomp == 'y'
    print 'Date: '
    publish_date = gets.chomp
    items = find_items
    Movie.new(*items, publish_date, silent)
  end

  def add_game
    print 'Is a multiplayer game [Y/N]: '
    multiplayer = gets.chomp == 'y'
    print 'Last player at: '
    last_play_at = gets.chomp
    print 'Date: '
    publish_date = gets.chomp
    items = find_items
    Game.new(*items, publish_date, multiplayer, last_play_at)
  end
end
