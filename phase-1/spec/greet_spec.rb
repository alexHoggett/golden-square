require 'greet.rb'

describe "greet method" do
  it "returns hello + name" do
    result = greet("Luiz")
    expect(result).to eq "Hello, Luiz!"
  end
end