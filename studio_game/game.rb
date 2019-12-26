require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
    attr_reader :title
    def initialize(title)
        @title = title
        @players = []
        @total_points = 0
    end

    def load_players(from_file)
        File.readlines(from_file).each do |line|
            add_player(Player.from_csv(line))
        end
    end

    def add_player(player)
        # The << is appending the player to the array
        @players << player
        # @players.push(player) 
    end

    def play(rounds)
        treasures = TreasureTrove::TREASURES

        puts "There are #{treasures.size} available"

        treasures.each do |treasure|
            puts "A #{treasure.name} is worth #{treasure.points} points."
        end

        1.upto(rounds) do |round|
        puts "\nRound #{round}"
            @players.each do |player|
                GameTurn.take_turn(player)           
                puts player
            end
        end
    end

    def print_name_and_health(player)
        puts "#{player.name} (#{player.health})"
    end

    def print_stats
        strong_players, not_strong_players = @players.partition { | player | player.strong? }
        puts "Final game stats for #{@title}"
        puts "\nStrong Players!"
        strong_players.each do |player|
            print_name_and_health(player)
        end

        puts "\nNot Strong Players: "
        not_strong_players.each do |player|
            print_name_and_health(player)
        end
        
        @players.each do |player|
            player.each_found_treasure do |treasure|
                puts "Player #{player.name} had #{treasure.name} for #{treasure.points}"
            end
            puts high_score_entry(player)
        end

        puts "Total Game Points: #{total_points}"

    end

    def total_points
        @players.reduce(0) {|sum, player| sum + player.points}
    end

    def high_score_entry(player)
        "#{player.name} #{player.score}"
    end

    def save_high_scores(to_file="high_scores.txt")
        File.open(to_file, "w") do |file|
            file.puts "#{@title} High Scores"
            @players.each do |player|
                file.puts high_score_entry(player)
            end
        end
    end

end