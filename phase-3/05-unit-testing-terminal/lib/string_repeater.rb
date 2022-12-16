class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will repeat a string many times."
    @io.puts "Please enter a string"
    string = @io.gets.chomp
    @io.puts "Please enter a number of repeats"
    amount = @io.gets.chomp
    raise "That is not a string!" if ! check_num(amount)
    @io.puts "Here is your result:"
    @io.puts string * amount.to_i
  end

  private 
  def check_num(string)
    # will return true if string is a number
    string.to_i.to_s == string
  end
end