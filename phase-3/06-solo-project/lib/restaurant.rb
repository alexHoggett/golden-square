require 'twilio-ruby'

class Restaurant
  def initialize(io)
    @dishes = []
    @ordered = []
    @io = io
  end

  def add_dish(dish)
    # Takes dish objects
    @dishes << dish
  end

  def show_dishes
    @dishes.each_with_index do |dish, index| 
      puts "#{index + 1}. #{dish.name} - £#{dish.price}"
    end
  end

  def order_dish(dish)
    @ordered << dish
  end

  def show_time
  end

  def receipt
    total = 0
    @ordered.tally.each do |order, tally|
      subtotal = order.price * tally
      puts "#{order.name} #{tally > 1 ? "x #{tally} " : ""}- £#{subtotal.round(2)}"
      total += subtotal
    end
    puts "Total - £#{total.round(2)}"
  end

  def run
    self.show_dishes
    @io.puts "Enter a number corresponding to an item from the menu. Press 'done' when finished"
    while true do
      order = @io.gets.chomp
      break if order == "done"
      @ordered << @dishes[order.to_i - 1]
    end
    self.receipt
  end
end

require_relative "dish"

# restaurant = Restaurant.new(Kernel)
# dish1 = Dish.new("Spaghetti", 12.45)
# dish2 = Dish.new("Kubba", 3.45)
# dish3 = Dish.new("Dolma", 8.45)
# restaurant.add_dish(dish1)
# restaurant.add_dish(dish2)
# restaurant.add_dish(dish3)
# restaurant.run
