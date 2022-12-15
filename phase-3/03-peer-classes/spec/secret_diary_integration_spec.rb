require "diary"
require "secret_diary"

describe "SecretDiary Integration" do
  it "constructs with a diary object" do
    diary = Diary.new("Dear Diary")
    secret_diary = SecretDiary.new(diary)
  end

  it "does not allow the user to read it if locked" do
    diary = Diary.new("Dear Diary")
    secret_diary = SecretDiary.new(diary)
    expect{ secret_diary.read }.to raise_error "Go away!"
  end

  it "locks after unlocking" do
    diary = Diary.new("Dear Diary")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect{ secret_diary.read }.to raise_error "Go away!"
  end

  it "unlocks and allows the user to read it" do
    diary = Diary.new("Dear Diary")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq diary.read
  end
end