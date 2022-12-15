require "secret_diary"

describe SecretDiary do
  it "constructs with a diary object" do
    fake_diary = double(:diary, read: "Dear Diary")
    secret_diary = SecretDiary.new(fake_diary)
  end

  it "does not allow the user to read it if locked" do
    fake_diary = double(:diary, read: "Dear Diary")
    secret_diary = SecretDiary.new(fake_diary)
    expect{ secret_diary.read }.to raise_error "Go away!"
  end

  it "locks after unlocking" do
    fake_diary = double(:diary, read: "Dear Diary")
    secret_diary = SecretDiary.new(fake_diary)
    secret_diary.unlock
    secret_diary.lock
    expect{ secret_diary.read }.to raise_error "Go away!"
  end

  it "unlocks and allows the user to read it" do
    fake_diary = double(:diary, read: "Dear Diary")
    secret_diary = SecretDiary.new(fake_diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq fake_diary.read
  end
end
