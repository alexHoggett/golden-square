class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
    @tracks << track
  end

  def all
    # Returns a list of track objects
    @tracks
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
    @tracks.select do |track|
      track.matches?(keyword)
    end
  end
end