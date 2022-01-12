require_relative '../music_album'

describe MusicAlbum do
  before(:each) do
    mock = double('intance')
    allow(mock).to receive(:items) { [] }
    @music_album = MusicAlbum.new(mock, mock, mock, mock, '1/12/2010', true)
  end

  it 'Should initialize the Music class' do
    expect(@music_album).to be_instance_of(MusicAlbum)
  end

  it 'Checks if publish_date attribute' do
    expect(@music_album.publish_date).to eq '1/12/2010'
  end

  it 'Check if can be achieved' do
    expect(@music_album.can_be_archived?).to be true
  end
end
