require_relative 'player'
require_relative 'treasure_trove'

describe Player do
    before do
        @initial_health = 150
        @player = Player.new("trixie", @initial_health)
    end

    it "has a captitalized name" do
        expect(@player.name).to eq("Trixie")
    end

    it "has an intitial health" do
        expect(@player.health).to eq(@initial_health)
    end

    it "has a string representation" do

        @player.found_treasure(Treasure.new(:hammer, 50))
        @player.found_treasure(Treasure.new(:hammer, 50))
        expect(@player.to_s).to eq("I'm Trixie with health = 150, points = 100, and score = 250.")
    end

    it "computes a score as the sum of health and points" do
        @player.found_treasure(Treasure.new(:hammer, 50))
        @player.found_treasure(Treasure.new(:hammer, 50))

        expect(@player.score).to eq(250)
    end

    it "increases health by 15 when w00ted" do
        @player.woot
        expect(@player.health).to eq(@initial_health + 15)
    end

    it "decreases health by 10 when blammed" do
        @player.blam
        expect(@player.health).to eq(@initial_health - 10)
    end


    context "with a health greater than 100" do
        before do
            @player = Player.new("Bob Ross", 150)
        end

        it "is strong" do
            # These do the same things
            # expect(@player.strong?).to eq(true)
            expect(@player).to be_strong
        end
    end

    context "with a health less than 100" do
        before do
            @player = Player.new("picasso", 100)
        end

        it "is not strong" do
            expect(@player).not_to be_strong
        end
    end

    it "computes point as the sum of all treasure points" do
        expect(@player.points).to eq(0)

        @player.found_treasure(Treasure.new(:hammer, 50))

        expect(@player.points).to eq(50)

        @player.found_treasure(Treasure.new(:crowbar, 400))

        expect(@player.points).to eq(450)

        @player.found_treasure(Treasure.new(:hammer, 50))

        expect(@player.points).to eq(500)
    end

    it "yields each found treasure and its total points" do
        @player.found_treasure(Treasure.new(:skillet, 100))
        @player.found_treasure(Treasure.new(:skillet, 100))
        @player.found_treasure(Treasure.new(:hammer, 50))
        @player.found_treasure(Treasure.new(:bottle, 5))
        @player.found_treasure(Treasure.new(:bottle, 5))
        @player.found_treasure(Treasure.new(:bottle, 5))
        @player.found_treasure(Treasure.new(:bottle, 5))
        @player.found_treasure(Treasure.new(:bottle, 5))

        yielded = []

        @player.each_found_treasure do |treasure|
            yielded << treasure
        end

        expect(yielded).to eq([
            Treasure.new(:skillet, 200),
            Treasure.new(:hammer, 50), 
            Treasure.new(:bottle, 25)
        ])
    end

    it "can be created from a CSV string" do
        player = Player.from_csv("bob-o, 10")
    
        expect(player.name).to eq("Bob-o")
        expect(player.health).to eq(10)
    end
       
    end