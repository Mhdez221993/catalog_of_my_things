# !/usr/bin/env ruby
require_relative 'file_handlers'
require_relative 'handlers'
require_relative 'genre'
require_relative 'item'
require_relative 'source'
require_relative 'author'
require_relative 'label'
require_relative 'book'
require_relative 'music_album'
require_relative 'movie'
require_relative 'game'

class App
  include Handlers
  include FileHandlers

  def initialize
    @genres = parse_genres
    @sources = parse_sources
    @authors = parse_authors
    @labels = parse_labels
    @albums = parse_albums
  end

  def option
    puts 'Welcome to Catalago of my of my things App!'
    puts "\n"
    puts 'Please choose an option by entering a number:'
    puts '1 -  List all books'
    puts '2 -  List all music albums'
    puts '3 -  List all movies'
    puts '4 -  List of games'
    puts '5 -  List all genres'
    puts '6 -  List all labels'
    puts '7 -  List all authors'
    puts '8 -  List all sources'
    puts '9 -  Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Add genre'
    puts '14 - Add source'
    puts '15 - Add author'
    puts '16 - Add label'
    puts 'q -  Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def start
    case gets.chomp
    when '1'
      list_item(@albums, Book)
      puts "\n"
    when '2'
      list_item(@albums, MusicAlbum)
      puts "\n"
    when '3'
      list_item(@albums, Movie)
      puts "\n"
    when '4'
      list_item(@albums, Game)
      puts "\n"
    when '5'
      list_item(@genres, Genre)
      puts "\n"
    when '6'
      list_item(@labels, Label)
      puts "\n"
    when '7'
      list_item(@authors, Author)
      puts "\n"
    when '8'
      list_item(@sources, Source)
      puts "\n"
    when '9'
      @albums.push(add_book)
    when '10'
      @albums.push(add_misic_album)
    when '11'
      @albums.push(add_movie)
    when '12'
      @albums.push(add_game)
    when '13'
      @genres.push(add_genre)
    when '14'
      @sources.push(add_source)
    when '15'
      @authors.push(add_author)
    when '16'
      @labels.push(add_label)
    when 'q'
      persit_data
      !exit
    else
      puts 'Wrong input, please try again'
      start
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity Metrics/MethodLength
  # rubocop:enable Metrics/MethodLength
end

def main
  app = App.new
  loop do
    app.option
    app.start
  end
end

main
