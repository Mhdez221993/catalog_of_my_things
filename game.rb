require_relative 'item'

class Game < Item
  attr_reader :silet, :last_play_at

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, multiplayer, last_play_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_play_at = last_play_at
  end
  # rubocop:enable Metrics/ParameterLists

 