class Track
  def initialize(title, artist) # title and artist are both strings
    raise "Please provide a string" if title.class != String || artist.class != String
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    # Returns true if the keyword matches either the title or artist
    @title.include?(keyword) || @artist.include?(keyword)
  end
end