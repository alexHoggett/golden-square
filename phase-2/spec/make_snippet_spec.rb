require 'make_snippet'

describe 'make_snippet method' do
  it 'returns the string if it is less than 5 words' do
    string = 'this is a test'
    expect(make_snippet(string)).to eq string
  end

  it 'return the first 5 words trailed by ...' do
    expect(make_snippet('this is a new test string')).to eq 'this is a new test...'
  end

  it 'returns an error if a string is not given' do
    expect { make_snippet(2) }.to raise_error "String not entered"
  end
end