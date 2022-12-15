require "diary"

describe Diary do
  it "constructs" do
    diary = Diary.new("Dear Diary")
  end

  it "returns the diary contents" do
    diary = Diary.new("Dear Diary")
    expect(diary.read).to eq "Dear Diary"
  end
end