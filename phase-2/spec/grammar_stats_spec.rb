require 'grammar_stats'

describe "GrammarStats class" do
  it "returns a true when 'Hello.' is given" do
    grammar_stats = GrammarStats.new()
    expect(grammar_stats.check("Hello.")).to eq true
  end

  it "returns false when 'Hello' is given" do
    grammar_stats = GrammarStats.new()
    expect(grammar_stats.check("Hello")).to eq false
  end

  it "returns false when 'hello.' is given" do
    grammar_stats = GrammarStats.new()
    expect(grammar_stats.check("hello.")).to eq false
  end

  it "returns an integer when a percentage is requested" do
    grammar_stats = GrammarStats.new()
    grammar_stats.check("hello")
    grammar_stats.check("Hello!")
    grammar_stats.check("hello")
    grammar_stats.check("hello")
    expect(grammar_stats.percentage_good.class).to eq Integer
  end

  it "returns a percentage of the texts that passed the check" do
    grammar_stats = GrammarStats.new()
    grammar_stats.check("hello")
    grammar_stats.check("Hello!")
    grammar_stats.check("hello")
    grammar_stats.check("hello")
    expect(grammar_stats.percentage_good).to eq 25
  end
end