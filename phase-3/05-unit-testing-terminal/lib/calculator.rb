class Calculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Please enter a number"
    first_num = @io.gets.chomp
    raise "That is not a number!" if ! check_num(first_num)
    @io.puts "Please enter another number"
    second_num = @io.gets.chomp
    raise "That is not a number!" if ! check_num(second_num)
    @io.puts "Here is your result:"
    @io.puts "#{first_num} - #{second_num} = #{first_num.to_i - second_num.to_i}"
  end

  def check_num(string)
    # will return true if string is a number
    string.to_i.to_s == string
  end
end