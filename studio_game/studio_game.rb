require_relative 'game'
require_relative 'player'
require_relative 'clumsy_player'

player5 = Player.new("Theodore", 5)
player6 = Player.new("Alvin", 8)
player7 = Player.new("The guy", 25)
chipmunks = Game.new("Chipmunkery")

clumsy_player = ClumsyPlayer.new("trip", 105)

# chipmunks.add_player(player5)
# chipmunks.add_player(player6)
# chipmunks.add_player(player7)

puts chipmunks.title
# chipmunks.play(3)
# chipmunks.print_stats

chipmunks.load_players(ARGV.shift || "players.csv")
chipmunks.add_player(clumsy_player)

loop do
    puts "How many rounds? ('quit' to exit)?"
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
        chipmunks.play(answer.to_i)
    when 'quit', 'exit'
        chipmunks.print_stats
        break
    else
        puts "Please enter a number or 'quit'"
    end
end

chipmunks.save_high_scores