=begin

# The name of the method.
- reading_time(string).

# What parameters it takes, their names and data types.
- 1 parameter called 'string' which is a String

# What it returns and the data type of that value.
- returns a string with tells the user an estimate of how long it would take to read the text with a reading time of 200 wpm.

# Any other side effects it might have.
- consider type conversion.

# Example tests
- if we passed a string containing 200 words, we would expect it to return '1 minute'
- if we passed an empty string, it should return '0 minutes'
- if we passed 100 words we would epect '0.50 minutes'
- if we passed anything that was not a string we should expect an error

=end

def reading_time(string)
  fail "Please provide a string!" if !string.is_a? String
  time_for_word = 60 / 200.0
  time_to_read = time_for_word * string.split.length / 60
  return "#{time_to_read.round(3)} minutes"
end

string1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam risus turpis, mollis sit amet nibh et, maximus blandit dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus luctus tortor sit amet risus fringilla, quis tincidunt enim luctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam posuere nunc augue, sed malesuada nisi accumsan id. Pellentesque eleifend maximus lorem a elementum. Sed pretium risus sed tellus eleifend, non molestie metus semper. Nullam mollis facilisis justo et eleifend. In rutrum mi nec quam interdum elementum.

Aenean in tincidunt felis. Maecenas ut urna nec ipsum venenatis aliquet et eu nunc. Phasellus hendrerit suscipit purus, sit amet facilisis velit. Pellentesque sagittis metus ac diam sollicitudin pharetra. Phasellus tellus risus, malesuada non urna id, lacinia tempus ante. Maecenas commodo facilisis interdum. Duis mattis, augue sit amet vulputate porta, erat leo laoreet enim, eu cursus mauris eros eget odio. Nunc faucibus tempus quam ac porta. Vestibulum scelerisque diam sed metus ullamcorper, non pellentesque tortor pulvinar. Vivamus dignissim porta felis. Cras ut tortor felis. Curabitur vel lorem ac orci ultrices ultricies. Integer facilisis elit vel placerat tincidunt. Curabitur volutpat pellentesque quam, ac fermentum dolor blandit sed. Quisque pellentesque lacus. "

# puts reading_time("Aenean in tincidunt felis. Maecenas ut urna nec ipsum venenatis aliquet et eu nunc. Phasellus hendrerit suscipit purus, sit amet facilisis velit. Pellentesque sagittis metus ac diam sollicitudin pharetra. Phasellus tellus risus, malesuada non urna id, lacinia tempus ante. Maecenas commodo facilisis interdum. Duis mattis, augue sit amet vulputate porta, erat leo laoreet enim, eu cursus mauris eros eget odio. Nunc faucibus tempus quam ac porta. Vestibulum scelerisque diam sed metus ullamcorper, non pellentesque tortor pulvinar. Vivamus dignissim porta felis. Cras ut tortor felis. Curabitur vel lorem ac orci ultrices ultricies. Integer facilisis elit vel placerat tincidunt. Curabitur volutpat pellentesque quam, ac fermentum dolor blandit sed. Quisque pellentesque lacus. ")