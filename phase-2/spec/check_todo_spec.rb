=begin
  The name of the method.
  - check_todo
  What parameters it takes, their names and data types.
  - takes one paramater which is a String called string.
  What it returns and the data type of that value.
  - returns a boolean value inidcating whether #TODO was found
  Any other side effects it might have.
  - ???

  TEST:

  - returns true if #TODO is found in the string
  - returns false if #TODO is not found in the string
  - returns an error if a string is not provided
=end

require 'check_todo'

describe 'check_todo method' do
  it 'return true if #TODO is found' do 
    expect(check_todo("blah blah #TODO")).to eq true
  end

  it 'return false if #TODO is not found' do
    expect(check_todo("blah blah")).to eq false
  end

  it 'returns an error if a string is not provided' do
    expect{ check_todo(5) }.to raise_error "String not provided!"
  end
end