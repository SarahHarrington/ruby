class Flyer
    attr_reader :name, :email, :miles_flown

    def initialize(name, email, miles_flown)
        @name = name
        @email = email
        @miles_flown = miles_flown
    end

    def to_s
        "#{name} (#{email}): #{miles_flown}"
    end
end

flyers = []

1.upto(5) do | n |
    flyers << Flyer.new("Flyer #{n}", "flyer#{n}@example.com", n * 1000)
end

flyers.each do | flyer |
    puts "#{flyer.name} - #{flyer.miles_flown} miles"
end

total_miles = 0

flyers.each { | flyer | total_miles += flyer.miles_flown }

puts "Total Miles Flown: #{total_miles}"

promotions = {"United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5}

promotions.each do | airline, reward |
    puts "Earn #{reward}x miles by flying #{airline}"
end

flyers.each do | flyer |
    promotions.each do | airline, promo |
        puts "#{flyer.name} could earn #{flyer.miles_flown * promo} by flying #{airline}"
    end
end