require 'count_words'

describe 'count_words' do
  it 'returns the number of words in a string' do
    expect(count_words('Hello how are you')).to eq(4)
  end

  context 'when not string' do
    it 'should alert user with error' do
      expect { count_words(45) }.to raise_error 'Please input a string!'
    end
  end
end
