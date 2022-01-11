module Handlers
  def list_books
    @books.each { |book| puts book }
  end

  def list_misic
    @music.each { |music| puts music }
  end

  def list_movies
    @movies.each { |movie| puts movie }
  end

  def list_games
    @games.each { |game| puts game }
  end

  def list_genres
    @genres.each { |genre| puts genre }
  end

  def list_labels
    @labels.each { |label| puts label }
  end

  def list_authors
    @authors.each { |author| puts author }
  end

  def list_sources
    @sources.each { |source| puts source }
  end

  def add_book
    puts 'Hi there'
  end

  def add_misic
    puts 'Hi there'
  end

  def add_movie
    puts 'Hi there'
  end

  def add_game
    puts 'Hi there'
  end

  def persit_date
    puts 'Hi there'
  end
end
