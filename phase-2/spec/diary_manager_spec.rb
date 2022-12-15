require "diary_manager"

describe "Diary Manager Integration" do
=begin
    - adds a diary entry
    - returns the correct number of words in all entries
=end

  it "returns a list of diary entries" do
    diary = Diary.new()
    entry1 = DiaryEntry.new('title1', 'contents1')
    entry2 = DiaryEntry.new('title2', 'contents2')
    diary.add(entry1)
    diary.add(entry2)
    expect(diary.all).to eq [entry1, entry2]
  end

  it "returns the correct number of words in all entries" do
    diary = Diary.new()
    entry1 = DiaryEntry.new('title1', 'This is contents 1')
    entry2 = DiaryEntry.new('title2', 'This is contents 2')
    diary.add(entry1)
    diary.add(entry2)
    expect(diary.count_words).to eq 8
  end

  it "returns the correct reading time" do
    diary = Diary.new()
    entry1 = DiaryEntry.new('title1', 'This is contents 1')
    entry2 = DiaryEntry.new('title2', 'This is contents 2')
    diary.add(entry1)
    diary.add(entry2)
    expect(diary.reading_time(4)).to eq 2
  end

  it "returns the best entry that could be read with the wpm and minutes provided" do
    diary = Diary.new()
    entry1 = DiaryEntry.new('title1', 'This is a contents')
    entry2 = DiaryEntry.new('title2', 'This is a slightly longer contents')
    entry3 = DiaryEntry.new('title3', 'This is an even longer context than the one before')
    diary.add(entry1)
    diary.add(entry2)
    diary.add(entry3)
    expect(diary.find_best_entry_for_reading_time(7, 1)).to eq entry2
  end

  context "no entries have been added" do
    it "returns a reading time of 0" do
      diary = Diary.new()
      expect(diary.reading_time(100)).to eq 0
    end

  end
end

describe Diary do
=begin

=end

  it "constructs" do 
    diary = Diary.new()
  end
end

describe DiaryEntry do
=begin
    - returns the correct number of words in the contents as an int
=end

  long_string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus leo at lectus aliquet, nec ultrices dui suscipit. Aenean sagittis suscipit consequat. Cras tincidunt, nibh tincidunt pellentesque faucibus, justo sapien imperdiet quam, eget faucibus elit mi eget turpis. Fusce ac semper massa. Nullam pulvinar quam vitae elit placerat imperdiet. Donec scelerisque sem lobortis diam ullamcorper ornare. Fusce a libero vel mauris vehicula gravida. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus bibendum urna vitae dolor laoreet viverra. Duis ut lorem augue. Cras ullamcorper nibh mauris, ac finibus augue ultrices eu. Fusce lorem lorem, condimentum vel aliquet ac, ullamcorper quis ex. Nunc in porttitor ipsum. Etiam vestibulum tempor elementum. Integer cursus vitae neque id convallis. Donec mi dui, eleifend sit."

  first_100 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus leo at lectus aliquet, nec ultrices dui suscipit. Aenean sagittis suscipit consequat. Cras tincidunt, nibh tincidunt pellentesque faucibus, justo sapien imperdiet quam, eget faucibus elit mi eget turpis. Fusce ac semper massa. Nullam pulvinar quam vitae elit placerat imperdiet. Donec scelerisque sem lobortis diam ullamcorper ornare. Fusce a libero vel mauris vehicula gravida. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus bibendum urna vitae dolor laoreet viverra. Duis ut lorem augue. Cras ullamcorper nibh mauris, ac finibus augue ultrices eu. Fusce lorem lorem, condimentum vel aliquet ac, ullamcorper quis"

  it "constructs" do
    diary_entry = DiaryEntry.new('Title', 'This is the Contents')
    expect(diary_entry.title).to eq 'Title'
    expect(diary_entry.contents).to eq 'This is the Contents'
  end

  it "returns an error when not initialised with strings" do
    expect { DiaryEntry.new(4, 'This is the Contents') }.to raise_error "Strings not used to initialize"
  end

  it "returns the number of words in the entry as an integer" do
    diary_entry = DiaryEntry.new('Title', 'This is the Contents')
    expect(diary_entry.count_words).to eq 4
  end

  # OLD TESTS

  it "reading_time returns an integer value" do
    diary_entry = DiaryEntry.new("My journal", "super secret words") 
    expect(diary_entry.reading_time(2).class).to eq Integer
  end

  it "returns an estimate of the reading time given their reading speed" do
    diary_entry = DiaryEntry.new("My journal", "super secret words")
    expect(diary_entry.reading_time(100)).to eq 3/100
  end

  it "returns the first contents chunk when words per minute and the minutes are given" do
    diary_entry = DiaryEntry.new("My journal", "super secret words")
    expect(diary_entry.reading_chunk(100, 3)).to eq "super secret words"
  end

  it "returns the second chunk when reading_chunk is done twice" do
    diary_entry = DiaryEntry.new("My journal", long_string)
    diary_entry.reading_chunk(100, 1)
    expect(diary_entry.reading_chunk(100, 1)).to eq "ex. Nunc in porttitor ipsum. Etiam vestibulum tempor elementum. Integer cursus vitae neque id convallis. Donec mi dui, eleifend sit."
  end

  it "starts from the beginning when the text has been fully read" do
    diary_entry = DiaryEntry.new("My journal", long_string)
    diary_entry.reading_chunk(100, 1)
    diary_entry.reading_chunk(100, 1)
    expect(diary_entry.reading_chunk(100, 1)).to eq first_100
  end
end