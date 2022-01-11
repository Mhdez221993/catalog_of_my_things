# !/usr/bin/env ruby
require_relative 'handlers'
require_relative 'file_handlers'

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
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts 'q - Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def start
    case gets.chomp
    when '1'
      list_books
    when '2'
      list_misic
    when '3'
      list_movies
    when '4'
      list_games
    when '5'
      list_genres
    when '6'
      list_labels
    when '7'
      list_authors
    when '8'
      list_sources
    when '9'
      add_book
    when '10'
      add_misic
    when '11'
      add_movie
    when '12'
      add_game
    when 'q'
      persit_date
      !exit
    else
      puts 'Wrong input, please try agin'
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
