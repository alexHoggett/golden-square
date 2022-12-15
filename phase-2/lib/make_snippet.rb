def make_snippet(string)
  fail "String not entered" if !string.is_a? String
  string_array = string.split(' ')
  return string if string_array.length <= 5
  string_array[0..4].join(' ') + '...'


end

puts make_snippet('this is a new test string')