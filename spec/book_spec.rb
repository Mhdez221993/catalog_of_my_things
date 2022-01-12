require_relative '../book'

describe Book do
  before(:each) do
    mock = double('intance')
    allow(mock).to receive(:items) { [] }
    @book = Book.new(mock, mock, mock, mock, '1/12/2010', 'Doe', 'good')
  end

  it 'Should initialize the Book class' do
    expect(@book).to be_instance_of(Book)
  end

  it 'Checks if publish_date attribute' do
    expect(@book.publish_date).to eq '1/12/2010'
  end

  it 'Chec if can be achieved' do
    expect(@book.can_be_archived?).to be true
  end
end
