def three_times 
    yield(1)
    yield(2)
    yield(3)
end

# three_times { puts "Ho!" }

three_times do |number|
    puts "#{number} situp"
    puts "#{number} coffee"
end