require_relative 'game'

describe Game do
    before do
        @game = Game.new("Unicorns")

        @initial_health = 100
        @player = Player.new("Pointer")

        @game.add_player(@player)
    end

    it "w00ts the player if a high number is rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(5)

        @game.play(2)
        expect(@player.health).to eq(@initial_health + (15 *2))
    end

    it "does nothing if the player gets a medium number rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(3)

        @game.play(2)
        expect(@player.health).to eq(@initial_health)
    end

    it "blams the player if a low nunmber is rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(1)

        @game.play(2)
        expect(@player.health).to eq(@initial_health - (10 * 2))
    end

    it "assigns a treasure for points during a player's turn" do
        game = Game.new("Knuckleheads")
        player = Player.new("unikitty")

        game.add_player(player)

        game.play(1)

        expect(player.points).not_to be_zero
    end

    it "computes total points as the sum of all player points" do
        game = Game.new("Boop")

        player1 = Player.new("beep")
        player2 = Player.new("beeeep")

        game.add_player(player1)
        game.add_player(player2)

        player1.found_treasure(Treasure.new(:hammer, 50))
        player1.found_treasure(Treasure.new(:hammer, 50))
        player2.found_treasure(Treasure.new(:crowbar, 400))

        expect(game.total_points).to eq(500)
    end
end