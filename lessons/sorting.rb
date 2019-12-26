require_relative 'movie'

movie1 = Movie.new("But, I'm a Cheerleader", 10)
movie2 = Movie.new("Airplane!", 8)
movie3 = Movie.new("Frozen II", 4)

movies = [movie1, movie2, movie3]

# <=> spaceship operator < = >
# Compares to two things
#movie1.rank <=> movie2.rank

puts movies.sort