require "gratitudes"

describe Gratitudes do
  it "returns a string of things to be grateful for" do
    gratitudes = Gratitudes.new()
    gratitudes.add("icecream", "corgis")
    result = gratitudes.format()
    expect(result).to eq "Be grateful for: icecream, corgis" 
  end
end