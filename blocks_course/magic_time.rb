def with_debugging
    puts "got here"
    result = yield
    puts "result was #{result}"
end

def with_expectation(expected_value)
    puts "running test"
    result = yield

    if result == expected_value
        puts "passed"
    else
        puts "Failed"
        puts "Expected #{expected_value}, but got #{result}"
    end
    
end

with_debugging do 
    magic_number = (23 - Time.now.hour) * Math::PI
end

with_expectation(5) { 2 + 2 }
with_expectation(4) { 2 + 2 }