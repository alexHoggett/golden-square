require "music_library"
require "track"

describe Track do
  it "constructs" do
    track = Track.new("Beatles", "Strawberry Fields")
  end

  it "returns true if keyword matches title or artist" do
    track = Track.new("Beatles", "Strawberry Fields")
    expect(track.matches?("Beatles")).to eq true
  end

  it "returns false if keyword does not match title or artist" do
    track = Track.new("Beatles", "Strawberry Fields")
    expect(track.matches?("Dylan")).to eq false
  end

  it "throws an error if a string is not used to initialized" do
    expect { Track.new("Hello", {key: "string"}) }.to raise_error "Please provide a string"
  end
end