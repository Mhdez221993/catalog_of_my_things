require_relative 'file_handlers'
require_relative 'book'
require_relative 'music_albu'

module Handlers
  include FileHandlers
  def list_item(name)
    @albums.each { |album| puts album if album.instance_of?(name) }
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
