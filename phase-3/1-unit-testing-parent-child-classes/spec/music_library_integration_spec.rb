require "music_library"
require "track"

describe "Music Library Integration" do
  it "constructs" do
    music_library = MusicLibrary.new
  end

  it "initialises with an empty track array" do
    music_library = MusicLibrary.new
    expect(music_library.all).to eq []
  end

  it "adds a single track to the library" do
    music_library = MusicLibrary.new
    track = Track.new("Beatles", "Strawberry Fields")
    music_library.add(track)
    expect(music_library.all).to eq [track]
  end

  it "returns all added tracks" do
    music_library = MusicLibrary.new
    track1 = Track.new("Dylan", "Lay Lady Lay")
    track2 = Track.new("Zeppelin", "Black Dog")
    track3 = Track.new("Beatles", "Strawberry Fields")
    music_library.add(track1)
    music_library.add(track2)
    music_library.add(track3)
    expect(music_library.all).to eq [track1, track2, track3]
  end

  it "returns all tracks that match the keyword" do
    music_library = MusicLibrary.new
    track1 = Track.new("Dylan", "Lay Lady Lay")
    track2 = Track.new("Dylan", "Black Dog")
    track3 = Track.new("Beatles", "Strawberry Fields")
    music_library.add(track1)
    music_library.add(track2)
    music_library.add(track3)
    expect(music_library.search("Dylan")).to eq [track1, track2]
  end
end