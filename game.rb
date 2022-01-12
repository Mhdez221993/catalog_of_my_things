require_relative 'item'

class Game < Item
  attr_reader :silet, :last_play_at

  def initialize(genre, author, source, label, publish_date, multiplayer, last_play_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_play_at = last_play_at
  end

  def can_be_archived?
    ''
  end

  def to_s
    "[Game]: Multiplayer #{@multiplayer}, Last played at: #{@last_play_at}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'multiplayer' => @multiplayer,
      'last_play_at' => @last_play_at
    }.to_json(*args)
  end
end
