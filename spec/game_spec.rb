require_relative '../game'

describe Game do
  before(:each) do
    mock = double('intance')
    allow(mock).to receive(:items) { [] }
    @game = Game.new(mock, mock, mock, mock, '1/12/2020', false, '1/02/2018')
  end

  it 'Should initialize the Game class' do
    expect(@game).to be_instance_of(Game)
  end

  it 'Checks if publish_date attribute' do
    expect(@game.publish_date).to eq '1/12/2020'
  end

  it 'Check if can be achieved' do
    expect(@game.can_be_archived?).to be false
  end
end
