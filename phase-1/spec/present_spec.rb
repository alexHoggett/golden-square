require 'present'

describe 'Present class' do
  it 'fails when wrapping a present twice' do 
    present = Present.new()
    present.wrap('first item')
    expect { present.wrap('something') }.to raise_error "A contents has already been wrapped."
  end

  it 'fails when unwrapping, if no present has been added' do
    present = Present.new()
    expect { present.unwrap() }.to raise_error "No contents have been wrapped."
  end

  it 'adds present to the contents' do 
    present = Present.new()
    present.wrap('present')
    expect(present.instance_variable_get(:@contents)).to eq 'present'
  end
end