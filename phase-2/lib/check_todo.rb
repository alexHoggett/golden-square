def check_todo(string)
  raise 'String not provided!' if string.class != String
  string.include? '#TODO'
end