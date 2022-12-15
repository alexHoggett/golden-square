# File: lib/diary.rb
class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    @entries << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    @entries
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    total = 0
    @entries.each do |entry|
      total += entry.count_words
    end
    return total
  end

  def reading_time(wpm) 
    # wpm is an integer representing
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    return self.count_words / wpm
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.

    words_to_read = wpm * minutes
    best_entry = @entries[0]
    p words_to_read

    @entries.each do |entry|
      # binding.irb
      best_entry = entry if entry.count_words <= words_to_read && entry.count_words > best_entry.count_words
    end
    return best_entry
  end
end

# File: lib/diary_entry.rb
class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    fail "Strings not used to initialize" unless title.class == String && contents.class == String
    @title = title
    @contents = contents
    @start_point = 0
  end

  def title
    # Returns the title as a string
    @title
  end

  def contents
    # Returns the contents as a string
    @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split(" ").length
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    return @contents.split(" ").length / wpm
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    end_point = @start_point + wpm / minutes
    contents_array = @contents.split(" ")
    string = contents_array[@start_point...end_point].join(" ")
    @start_point = end_point
    @start_point = 0 if @start_point >= @contents.split(" ").length
    return string
  end
end