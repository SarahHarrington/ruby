require_relative 'movie'
require_relative 'playlist'
require_relative 'movie3d'

movie1 = Movie.new("goonies", 10)
movie2 = Movie.new("ghostbusters", 9)
movie3 = Movie.new("goldfinder")

playlist1 = Playlist.new("Bob")

# The ARGV.shift says that if there is an argument added, to use that file, if not use the default
playlist1.load(ARGV.shift || "movies.csv")


movie3d = Movie3D.new("love actually", 10, 30)
playlist1.add_movie(movie3d)

loop do
    puts "How many viewings? ('quit' to exit)"
    answer = gets.chomp.downcase
    case answer 
    when /^\d+$/
        playlist1.play(answer.to_i)  
    when 'quit', 'exit'
        playlist1.print_stats
        break
    else
        puts "Please enter a number or 'quit'"
    end

    puts "Enjoy your #{answer} viewings"
    playlist1.save
      
end

