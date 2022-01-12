require 'json'

module FileHandlers
  def parse_genres
    file = 'genres.json'
    if File.exist? file
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def parse_sources
    file = 'sources.json'
    if File.exist? file
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def parse_authors
    file = 'authors.json'
    if File.exist? file
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def parse_labels
    file = 'labels.json'
    if File.exist? file
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def find_items_by_id(my_class, id)
    my_class.each { |genre| return genre if genre.id == id }
  end

  def find_items(album)
    genre = find_items_by_id(@genres, album['genre'])
    author = find_items_by_id(@authors, album['author'])
    source = find_items_by_id(@sources, album['source'])
    label = find_items_by_id(@labels, album['label'])
    [genre, author, source, label]
  end

  def parse_book_album(album)
    result = find_items(album)
    book = Book.new(*result, album['publish_date'], album['publisher'], album['cover_state'])
    book.id = album['id']
    book
  end

  def parse_misic_album(album)
    result = find_items(album)
    music_album = MusicAlbum.new(*result, album['publish_date'], album['on_spotify'])
    music_album.id = album['id']
    music_album
  end

  def parse_movie_album(album)
    result = find_items(album)
    movie = Movie.new(*result, album['publish_date'], album['silent'])
    movie.id = album['id']
    movie
  end

  def parse_game_album(album)
    result = find_items(album)
    game = Game.new(*result, album['publish_date'], album['multiplayer'], album['last_play_at'])
    game.id = album['id']
    game
  end

  def parse_albums
    file = 'albums.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |album|
        case album['json_class']
        when 'Book'
          parse_book_album(album)
        when 'MusicAlbum'
          parse_misic_album(album)
        when 'Movie'
          parse_movie_album(album)
        when 'Game'
          parse_game_album(album)
        end
      end
    else
      []
    end
  end

  def persit_data
    open('genres.json', 'w') { |f| f.write JSON.generate(@genres) } unless @genres.empty?
    open('labels.json', 'w') { |f| f.write JSON.generate(@labels) } unless @labels.empty?
    open('authors.json', 'w') { |f| f.write JSON.generate(@authors) } unless @authors.empty?
    open('sources.json', 'w') { |f| f.write JSON.generate(@sources) } unless @sources.empty?
    open('albums.json', 'w') { |f| f.write JSON.generate(@albums) } unless @albums.empty?
  end
end
