require "report_length"

describe "report length method" do
  it "returns the size of a string passed to it" do 
    result = "Luiz likes bananas"
    expect(report_length(result)).to eq "This string was #{result.length} characters long."
  end
end