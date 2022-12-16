require "calculator"

describe Calculator do
  
  it "gets user input and outputs correct result" do
    io = double :io
    expect(io).to receive(:puts).with("Please enter a number").ordered
    expect(io).to receive(:gets).and_return("4").ordered
    expect(io).to receive(:puts).with("Please enter another number").ordered
    expect(io).to receive(:gets).and_return("3").ordered
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("4 - 3 = 1").ordered
    calculator = Calculator.new(io)
    calculator.run
  end

  it "raises an error if a number is not provided" do
    io = double :io
    expect(io).to receive(:puts).with("Please enter a number").ordered
    expect(io).to receive(:gets).and_return("4").ordered
    expect(io).to receive(:puts).with("Please enter another number").ordered
    expect(io).to receive(:gets).and_return("Alex").ordered
    calculator = Calculator.new(io)
    expect{ calculator.run }.to raise_error "That is not a number!"
  end
end