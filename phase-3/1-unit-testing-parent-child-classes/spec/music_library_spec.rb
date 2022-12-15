require "music_library"
require "track"

describe MusicLibrary do
  it "constructs" do
    music_library = MusicLibrary.new
  end

  it "adds a track" do
    music_library = MusicLibrary.new
    track = double("fake_track", title: "beatles")
    music_library.add(track)
    expect(music_library.all).to eq [track]
  end

  it "returns all added tracks" do
    music_library = MusicLibrary.new
    track1 = double("fake_track", title: "beatles")
    track2 = double("fake_track", title: "zeppelin")
    track3 = double("fake_track", title: "dylan")
    music_library.add(track1)
    music_library.add(track2)
    music_library.add(track3)
    expect(music_library.all).to eq [track1, track2, track3]
  end

  it "returns all tracks that match the keyword" do
    music_library = MusicLibrary.new
    track1 = double("fake_track", matches?: false)
    expect(track1).to receive("matches?").with("red").and_return(false)
    track2 = double("fake_track", matches?: true)
    expect(track2).to receive("matches?").with("red").and_return(true)
    track3 = double("fake_track", matches?: true)
    expect(track3).to receive("matches?").with("red").and_return(true)
    music_library.add(track1)
    music_library.add(track2)
    music_library.add(track3)
    expect(music_library.search("red")).to eq [track2, track3]
  end
end