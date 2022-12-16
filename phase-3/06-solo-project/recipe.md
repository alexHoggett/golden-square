# Restaurant

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## Class structure

```ruby
class Restaurant
  def initialize
  end

  def add_dish(dish)
  # Takes dish objects
  end

  def show_dishes
  end

  def order_dish
  end

  def show_time
  end

  def receipt
  end

  def run
  end
end

class Dish
  initialize(name, cost)
  end

  def name
  end

  def cost
  end
end

```

## Testing

```ruby
# testing dish class constructs
dish = Dish.new("Spaghetti", 12.33)
expect(dish.name).to eq "Spaghetti"
expect(dish.cost).to eq 12.33

# Unit tests for restaurant:

# can add and display dishes
restaurant = Restaurant.new
fake_dish1 = double(:spaghetti, name: "Spaghetti", cost: 12.49)
fake_dish2 = double(:dolma, name: "Dolma", cost: 10.99)
restaurant.add_dish(fake_dish1)
restaurant.add_dish(fake_dish2)
expect(restaurant.show_dishes).to eq "1. #{fake_dish1.name} - £#{fake_dish1.cost}\n 2. #{fake_dish2.name} - £#{fake_dish2.cost}"

# shows a corect reciept
restaurant = Restaurant.new
fake_dish1 = double(:spaghetti, name: "Spaghetti", cost: 12.49)
fake_dish2 = double(:dolma, name: "Dolma", cost: 10.99)
fake_dish3 = double(:kubba, name: "Kubba", cost: 3.99)
restaurant.add_dish(fake_dish1)
restaurant.add_dish(fake_dish2)
restaurant.add_dish(fake_dish3)
restaurant.order_dish(fake_dish1)
restaurant.order_dish(fake_dish2)
restaurant.order_dish(fake_dish2)
restaurant.order_dish(fake_dish3)
expect(restaurant.receipt).to eq "Spaghetti - £12.49\n Dolma x 2 - £21.98\n Kubba - £3.99\n Total - £38.46"
```
