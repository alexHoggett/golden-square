=begin


    1. The name of the method.
    sentence_case
    2. What parameters it takes, their names and data types.
    one param called string, of class String
    3. What it returns and the data type of that value.
    a string telling the user how to improve their grammar
    Any other side effects it might have.

    As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

=end

def sentence_case(string)
  punctuation = ['!', '.', '?']
  has_capital = string[0] == string[0].upcase
  has_punctuation = punctuation.include? string[-1]
  return 'You need a capital letter and punctuation!' if !has_punctuation && !has_capital
  return "You need a capital letter!" if !has_capital
  "You need punctuation!" if !has_punctuation
end
