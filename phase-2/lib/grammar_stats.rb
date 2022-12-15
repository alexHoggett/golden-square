class GrammarStats
  def initialize
    @text_checked = 0
    @text_passed = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    # puts text[-1](/[[:punct:]]/)
    result = text[0] == text[0].upcase && /[[:punct:]]/.match?(text[-1])
    @text_checked += 1
    @text_passed += 1 if result
    return result
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    percentage = (@text_passed.to_f / @text_checked) * 100
    percentage.to_i
  end
end

grammar_stats = GrammarStats.new()

p grammar_stats.check("Hello!")