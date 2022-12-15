require "cat_facts"

describe CatFacts do
  it "returns a cat fact from the API" do
    receiver_dbl = double(:receiver)
    allow(receiver_dbl)
    .to receive(:get)
    .with(URI("https://catfact.ninja/fact"))
    .and_return('{"fact":"Cats can be right-pawed or left-pawed.","length":38}')
    cat_facts = CatFacts.new(receiver_dbl)

    expect(cat_facts.provide).to eq "Cat fact: Cats can be right-pawed or left-pawed."
  end
end