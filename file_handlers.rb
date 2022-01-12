module FileHandlers
  def parse_genres
    file = 'genres.json'
    if File.exist? file
      JSON.parse(File.read(file), create_addition: true)
    else
      []
    end
  end

  def parse_sources
    file = 'sources.json'
    if File.exist? file
      JSON.parse(File.read(file), create_addition: true)
    else
      []
    end
  end

  def parse_authors
    file = 'authors.json'
    if File.exist? file
      JSON.parse(File.read(file), create_addition: true)
    else
      []
    end
  end

  def parse_labels
    file = 'labels.json'
    if File.exist? file
      JSON.parse(File.read(file), create_addition: true)
    else
      []
    end
  end

  def find_items(album)
    genre = @genres.each { |genre| return genre if genre.id == album['genre_id'] }
    author = @authors.each { |author| return author if author.id == album['author_id'] }
    source = @sources.each { |source| return source if source.id == album['source_id'] }
    label = @labels.each { |label| return label if label.id == album['label_id'] }
    [genre, author, source, label]
  end

  def parse_book_album(album)
    result = find_items(album)
    Book.new(*result, album['publish_date'])
  end

  def parse_misic_album(_album)
    result = find_items(album)
    MusicAlbum.new(*result, album['publish_date'])
  end

  def parse_movie_album(_album)
    result = find_items(album)
    Movie.new(*result, album['publish_date'])
  end

  def parse_game_album(_album)
    result = find_items(album)
    Game.new(*result, album['publish_date'])
  end

  def parse_albums
    file = 'misic_album.json'
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
