class Sensor
    def temperature
        rand(100..200)
    end

    def level
        rand(1..5)
    end
end

sensor = Sensor.new

def with_checking(description)
    puts "Checking #{description}"
    #* This allows you to execute to "wrap" or "execute around" the code you need to check
    result = yield 
    if result
        puts "Ok!"
    else
        puts "FAILED"
    end
end

with_checking("temperature") { sensor.temperature < 150 }
with_checking("level") { sensor.level > 3 }
