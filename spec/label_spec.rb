require_relative '../label'

describe Label do
  before(:each) do
    @label = Label.new 'New', 'Red'
  end

  it 'Should initialize the Author class' do
    expect(@label).to be_instance_of(Label)
  end

  it 'Checks if name attribute' do
    expect(@label.title).to eq 'New'
  end

  it 'Checks if name attribute' do
    expect(@label.color).to eq 'Red'
  end
end
