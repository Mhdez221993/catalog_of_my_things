require_relative '../source'

describe Source do
  before(:each) do
    @source = Source.new 'libary'
  end

  it 'Should initialize the Source class' do
    expect(@source).to be_instance_of(Source)
  end

  it 'Checks if name attribute' do
    expect(@source.name).to eq 'libary'
  end
end
