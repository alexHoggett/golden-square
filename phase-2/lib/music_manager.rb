=begin
    The name of the class.
    - MusicManager

    The design of its initializer and the parameters it takes.
    - does not need parameters, can be initialised with a track. setup an instance variable as an array to store the tracks

    The design of its public methods, including:
        Their names and purposes
        - tracks, add_track

        What parameters they take and the data types.
        - add_track(string)
        What they return and that data type
        - add_track returns nothing, tracks returns the array of tracks

        Any other side effects they might have.
        - not that i can think of
=end

class MusicManager
  def initialize(track)
    @tracks = [track]
  end

  def tracks
    @tracks
  end

  def add_track(track)
    # track is a string
    @tracks.push(track)
  end
end