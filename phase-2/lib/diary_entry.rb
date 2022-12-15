class DiaryEntry
    def initialize(title, contents) 
        @title = title
        @contents = contents
        @start_point = 0
    end

    def title
        return @title
    end

    def contents
        return @contents
    end

    def count_words
        @contents.split(" ").length
    end

    def reading_time(wpm)
        return @contents.split(" ").length / wpm
    end

    def reading_chunk(wpm, minutes)
        end_point = @start_point + wpm / minutes
        contents_array = @contents.split(" ")
        string = contents_array[@start_point...end_point].join(" ")
        @start_point = end_point
        @start_point = 0 if @start_point >= @contents.split(" ").length
        return string
    end
end