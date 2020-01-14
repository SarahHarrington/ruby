class Genres
    def initialize
        @names = ["Action", "Comedy", "Sci-fi", "Adventure"]
    end

    def each
        @names.each { | name | yield name }
    end
end

genres = Genres.new

genres.each { | name | puts name}