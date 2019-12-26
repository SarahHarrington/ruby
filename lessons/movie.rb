require_relative 'snack_bar'
require_relative 'rankable'

class Movie
    include Rankable

    #This is Ruby's way of short cutting creating a method that will return the instance variable
    # attr_reader :rank

    #the attr_writer and attr_reader can be combined by using attr_accessor
    attr_accessor :title, :rank

    def initialize(title, rank=0)
        # @ in front of the variable name makes it an instance variable
        # This makes it available to all of the methods in the class?
     @title = title.capitalize
     @rank = rank
     @snack_carbs = Hash.new(0)
    end

    def self.from_csv(line)
        title, rank = line.split(",")
        movie = Movie.new(title, Integer(rank))
    end

    def to_csv
        "#{@title},#{@rank}"
    end

    def each_snack
        @snack_carbs.each do |name, carbs|
            snack = Snack.new(name, carbs)
            yield snack
        end
    end

    def ate_snack(snack)
        @snack_carbs[snack.name] += snack.carbs
        puts "#{@title} led to #{snack.carbs} #{snack.name}"
        puts "#{@title}'s snacks: #{@snack_carbs}"
    end

    def carbs_consumed
        @snack_carbs.values.reduce(0, :+)
    end

    def to_s
        "#{@title} has a rank of #{@rank}"
    end
end

movie1 = Movie.new("goonies", 2)
puts movie1