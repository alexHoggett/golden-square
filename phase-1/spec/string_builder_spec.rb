require "string_builder"

describe StringBuilder do
  it "return a length of a string" do
    string_builder = StringBuilder.new()
    string_builder.add("Hello World")
    result = string_builder.size()
    expect(result).to eq 11
  end

  it "returns a string" do
    string_builder = StringBuilder.new()
    string_builder.add("Hello World")
    result = string_builder.output()
    expect(result).to eq "Hello World"
  end
end