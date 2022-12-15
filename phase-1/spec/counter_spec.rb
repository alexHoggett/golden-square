require "counter"

describe Counter do
  it "returns the count value in a string" do 
    counter = Counter.new()
    counter.add(5)
    result = counter.report()
    expect(result).to eq "Counted to #{5} so far"
  end
end

