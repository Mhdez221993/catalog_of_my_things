require_relative '../author'

describe Author do
  before(:each) do
    @author = Author.new 'John', 'Doe'
  end

  it 'Should initialize the Author class' do
    expect(@author).to be_instance_of(Author)
  end

  it 'Checks if name attribute' do
    expect(@author.first_name).to eq 'John'
  end

  it 'Checks if name attribute' do
    expect(@author.last_name).to eq 'Doe'
  end
end
