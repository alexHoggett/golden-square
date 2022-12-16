require "dish"

describe Dish do 
  it "constructs and stores its values" do
    dish = Dish.new("Spaghetti", 12.33)
    expect(dish.name).to eq "Spaghetti"
    expect(dish.price).to eq 12.33
  end
end