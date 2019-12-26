require_relative 'treasure_trove'
require_relative 'loaded_die'

module GameTurn
    def self.take_turn(player)
        die = Die.new

            case number_rolled = die.roll
            when 1..2
                player.blam
            when 3..4
                puts "Nothing happened"
            else 
                player.woot
            end

            treasure = TreasureTrove.random
            player.found_treasure(treasure)
    end
end