require_relative '../movie'

describe Movie do
  before(:each) do
    mock = double('intance')
    allow(mock).to receive(:items) { [] }
    @movie = Movie.new(mock, mock, mock, mock, '1/12/2020', false)
  end

  it 'Should initialize the Movie class' do
    expect(@movie).to be_instance_of(Movie)
  end

  it 'Checks if publish_date attribute' do
    expect(@movie.publish_date).to eq '1/12/2020'
  end

  it 'Check if can be achieved' do
    expect(@movie.can_be_archived?).to be false
  end
end
