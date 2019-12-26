require_relative 'movie'

describe Movie do 

#     it "has a capitalized title" do
#         movie = Movie.new("goonies", 10)
#         expect(@movie)
#         movie.title.should == "Goonies"
#     end
end

context "created with a default rank" do
    before do
        @movie = Movie.new("goonies")
    end

    it "has a rank of 0" do
        expect(@movie.rank).to eq(0)
    end
end

context "with a rank of at least 10" do
    before do
        @movie = Movie.new("goonies", 10)

        it "is a hit" do
            expect(@movie.hit?).to eq(true)
        end
    end
end