require_relative '../genre'

describe Genre do
  before(:each) do
    @genre = Genre.new 'comedy'
  end

  it 'Should initialize the Author class' do
    expect(@genre).to be_instance_of(Genre)
  end

  it 'Checks if name attribute' do
    expect(@genre.name).to eq 'comedy'
  end
end
