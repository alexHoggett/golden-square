require 'sentence_case'

describe 'sentence_case' do
  it 'will instruct the user to capitalise if first letter is lower case' do
    expect(sentence_case('this is an example.')).to eq 'You need a capital letter!'
  end
  it 'will instruct the user to add punctuation if there is none at end of sentence' do
    expect(sentence_case('This is an example')).to eq 'You need punctuation!'
  end
  it 'will instruct the user to capitalise and add punctuation if both are required' do
    expect(sentence_case('this is an example')).to eq 'You need a capital letter and punctuation!'   
  end
end