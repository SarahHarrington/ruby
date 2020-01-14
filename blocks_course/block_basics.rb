# 1.step(10, 2) do | n |
#     puts "#{n} situp"
#     puts "#{n} pushup"
#     puts "#{n} chinup"
# end

# name = "curly"
# number = 100

# 3.times do | number; temp |
#     name = "Moe"
#     temp = 98.6
#     puts "#{number} Howdy, #{name}"
# end

# puts name
# puts number

# weekdays = ["monday", "tuesday", "wednesday", "thursday", "friday"]

# weekdays.each do | day |
#     puts day.capitalize
# end

# weekdays.each { | day | puts day.capitalize }

# taxes = { "CO" => 0.02, "MT" => 0.00, "AZ" => 0.04 }

# taxes.each do | key, value |
#     puts "#{key}: #{value * 100}%"
# end

# pending_orders, completed_orders = orders.partition { |o| o.status == :pending }

# emails = orders.map { | order | order.email.downcase }

# numbers = [1, 2, 3, 4]
# #reduce will take the sum, and assign it back to the block, don't need to do +=
# result = numbers.reduce(0) { | sum, number | sum + number }
# puts result

# result = numbers.reduce(:+)
# puts result

# def run_my_block
#     puts "Starting method..."
#     yield
#     puts "Back in the method."
# end


# run_my_block do
#     puts "running block!"
# end

# def roll
#     # number = rand(1..6)
#     puts "Starting method"
#     yield "Bob", rand(1..6)
#     yield "Kadoodle", rand(1..6)
#     puts "All done!"
# end

# roll do | name, number |
#     puts "#{name} rolled a #{number}"
# end

def roll
    number = rand(1..6)
    result = yield("Larry", number)
    puts "The block returned #{result}"
end

roll do | name, number |
    puts "#{name} rolled a #{number}"
    number * 2
end