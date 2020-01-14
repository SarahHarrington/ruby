class Phone
    attr_accessor :airplane_mode
    def initialize
        @airplane_mode = false
    end

    def text(message)
        if @airplane_mode
            puts "Saved text: #{message}"
        else
            puts "Sent text: #{message}"
        end
    end

    def in_airplane_mode
        @airplane_mode = true
        yield
       
    rescue Exception => e
        puts e.message
    ensure
        @airplane_mode = false
    end
end

phone = Phone.new

phone.text("Just landed!")

phone.in_airplane_mode do
    phone.text("just took off!")
    phone.text("at 30,0000 feet")
    raise "Whoops!"
end