def count_words(string)
  raise 'Please input a string!' if string.class != String

  string.split.length
end
