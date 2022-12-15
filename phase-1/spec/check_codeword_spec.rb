require "check_codeword"

describe "check codeword method" do
  it "returns 'Correct' when passed 'horse'" do
    result = check_codeword("horse")
    expect(result).to eq "Correct! come in."
  end    

  it "returns 'Wrong' when passed the wrong string" do
    result = check_codeword("yellow")
    expect(result).to eq "WRONG!"
  end

  it "returns 'Close, but nope.' when passed the correct string" do
    result = check_codeword("house")
    expect(result).to eq "Close, but nope."
  end
end