class Flyer
    attr_reader :name, :email, :miles_flown
    attr_accessor :status
  
    def initialize(name, email, miles_flown, status=:bronze)
      @name = name
      @email = email
      @miles_flown = miles_flown
      @status = status
    end
  
    def to_s
      "#{name} (#{email}): #{miles_flown} - #{status}"
    end
  end
  
  flyers = []
  flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
  flyers << Flyer.new("Moe", "moe@example.com", 1000)
  flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
  flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

  frequent_flyers = flyers.select { | flyer | flyer.miles_flown >= 3000 }
  puts frequent_flyers

  regular_flyers = flyers.reject { | flyer | flyer.miles_flown >= 3000 }
  puts regular_flyers

  puts flyers.any? { | flyer | flyer.status == :platinum}

  puts flyers.find { | flyer | flyer.status == :bronze }

platinum, others = flyers.partition { | flyer | flyer.status == :platinum}

puts "platinum flyers:"
puts platinum

puts "other flyers"
puts others

nametags = flyers.map { | flyer | "#{flyer.name} (#{flyer.status.upcase})"}
puts nametags

totals_in_kms = flyers.map { | flyer | flyer.miles_flown * 1.6 }.reduce(0, :+)
puts totals_in_kms

total_miles = flyers.reduce(0) { | sum, flyer | sum + flyer.miles_flown }
puts total_miles