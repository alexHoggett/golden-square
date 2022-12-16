require "restaurant"

describe Restaurant do
  it "can add and display all dishes" do
    fake_dish1 = double(:spaghetti, name: "Spaghetti", price: 12.49)
    fake_dish2 = double(:dolma, name: "Dolma", price: 10.99)
    io = double(:io)
    restaurant = Restaurant.new(io)
    restaurant.add_dish(fake_dish1)
    restaurant.add_dish(fake_dish2)

    # This test hinges on whether we use puts to output the menu line by line
    # expect(io).to receive(:puts).with("1. #{fake_dish1.name} - £#{fake_dish1.price}").ordered
    # expect(io).to receive(:puts).with("2. #{fake_dish2.name} - £#{fake_dish2.price}").ordered
    # restaurant.show_dishes

    expect { restaurant.show_dishes }.to output("1. #{fake_dish1.name} - £#{fake_dish1.price}\n2. #{fake_dish2.name} - £#{fake_dish2.price}\n").to_stdout
  end

  it "shows a correct receipt" do
    io = double(:io)
    restaurant = Restaurant.new(io)
    fake_dish1 = double(:spaghetti, name: "Spaghetti", price: 12.49)
    fake_dish2 = double(:dolma, name: "Dolma", price: 10.99)
    fake_dish3 = double(:kubba, name: "Kubba", price: 3.99)
    restaurant.add_dish(fake_dish1)
    restaurant.add_dish(fake_dish2)
    restaurant.add_dish(fake_dish3)
    restaurant.order_dish(fake_dish1)
    restaurant.order_dish(fake_dish2)
    restaurant.order_dish(fake_dish2)
    restaurant.order_dish(fake_dish3)
    expect{ restaurant.receipt }.to output("Spaghetti - £12.49\nDolma x 2 - £21.98\nKubba - £3.99\nTotal - £38.46\n").to_stdout
  end

  it "contiually asks the user to add dishes to their order" do
    io = double(:io)
    restaurant = Restaurant.new(io)
    fake_dish1 = double(:spaghetti, name: "Spaghetti", price: 12.49)
    fake_dish2 = double(:dolma, name: "Dolma", price: 10.99)
    fake_dish3 = double(:kubba, name: "Kubba", price: 3.99)
    restaurant.add_dish(fake_dish1)
    restaurant.add_dish(fake_dish2)
    restaurant.add_dish(fake_dish3)

    expect(io).to receive(:puts).with("Enter a number corresponding to an item from the menu. Press 'done' when finished").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:gets).and_return("done").ordered

    expect { restaurant.run }.to output("Spaghetti - £12.49\nDolma - £10.99\n").to_stdout
  end
end