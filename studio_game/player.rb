require_relative 'treasure_trove'
require_relative 'playable'

class Player
    include Playable

    # attr_reader :health
    attr_accessor :name, :health
    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
        @found_treasures = Hash.new(0)
    end

    def self.from_csv(line)
        name, health = line.split(",")
        player = Player.new(name, Integer(health))
    end

    def to_s
        "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
    end

    def score
        @health + points
    end

    def <=> (other_player) 
        other_player.score <=> score
    end

    def found_treasure(treasure)
        @found_treasures[treasure.name] += treasure.points
        puts "#{@name} found #{treasure.name} worth #{treasure.points}"
        puts "#{@name}'s treasures: #{@found_treasures}"
    end

    def points
        puts "#{@found_treasures}"
        @found_treasures.values.reduce(0, :+)
    end

    def each_found_treasure
        @found_treasures.each do |name, points|
            yield Treasure.new(name, points)
        end
    end


end

#This if expression, makes it so the code insdie only runs
#if the current source file matches the name of the Ruby program file
if __FILE__ == $0
    player = Player.new("Trixie")
    puts player.name
    puts player.health
    player.woot
    puts player.health
    player.blam
    puts player.health
end