require 'diary_entry'
 describe "Diary entry class" do

    long_string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus leo at lectus aliquet, nec ultrices dui suscipit. Aenean sagittis suscipit consequat. Cras tincidunt, nibh tincidunt pellentesque faucibus, justo sapien imperdiet quam, eget faucibus elit mi eget turpis. Fusce ac semper massa. Nullam pulvinar quam vitae elit placerat imperdiet. Donec scelerisque sem lobortis diam ullamcorper ornare. Fusce a libero vel mauris vehicula gravida. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus bibendum urna vitae dolor laoreet viverra. Duis ut lorem augue. Cras ullamcorper nibh mauris, ac finibus augue ultrices eu. Fusce lorem lorem, condimentum vel aliquet ac, ullamcorper quis ex. Nunc in porttitor ipsum. Etiam vestibulum tempor elementum. Integer cursus vitae neque id convallis. Donec mi dui, eleifend sit."

    first_100 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus leo at lectus aliquet, nec ultrices dui suscipit. Aenean sagittis suscipit consequat. Cras tincidunt, nibh tincidunt pellentesque faucibus, justo sapien imperdiet quam, eget faucibus elit mi eget turpis. Fusce ac semper massa. Nullam pulvinar quam vitae elit placerat imperdiet. Donec scelerisque sem lobortis diam ullamcorper ornare. Fusce a libero vel mauris vehicula gravida. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus bibendum urna vitae dolor laoreet viverra. Duis ut lorem augue. Cras ullamcorper nibh mauris, ac finibus augue ultrices eu. Fusce lorem lorem, condimentum vel aliquet ac, ullamcorper quis"

    it "It initialises with the correct title and contents" do
        diary_entry = DiaryEntry.new("My journal", "secret")
        expect(diary_entry.instance_variable_get(:@title)).to eq "My journal"
        expect(diary_entry.instance_variable_get(:@contents)).to eq "secret"
    end

    it "It returns the title" do
        diary_entry = DiaryEntry.new("My journal", "secret")
        expect(diary_entry.title).to eq "My journal"
    end

    it "returns the contents" do
        diary_entry = DiaryEntry.new("My journal", "secret")
        expect(diary_entry.contents).to eq "secret"
    end
    
    it "returns the number of words in the contents" do
        diary_entry = DiaryEntry.new("My journal", "super secret words")
        expect(diary_entry.count_words).to eq 3
    end

    it "returns the number of words in the contents" do
        diary_entry = DiaryEntry.new("My journal", "super secret words")
        expect(diary_entry.count_words).to eq 3
    end

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