require "music_manager"

describe "MusicManager Class" do 
  it "initialises with a track" do
    music_manager = MusicManager.new('song')
    expect(music_manager.tracks).to eq ['song']
  end

  it "returns an array of tracks" do
    music_manager = MusicManager.new('song')
    expect(music_manager.tracks).to eq ['song']
    expect(music_manager.tracks.class).to eq Array
  end

  it "successfully adds a track and stores it" do
    music_manager = MusicManager.new('song')
    music_manager.add_track('another song')
    expect(music_manager.tracks).to eq ['song', 'another song']
  end
end