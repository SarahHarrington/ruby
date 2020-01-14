class Song
    attr_reader :name, :artist, :duration

    def initialize(name, artist, duration)
        @name = name
        @artist = artist
        @duration = duration
    end

    def play
        puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
    end
end

song1 = Song.new("Fresh Air", "Brother Ali", 3)
song2 = Song.new("Sleeping In", "The Postal Service", 4)
song3 = Song.new("Juice", "Lizzo", 5)

class Playlist
    def initialize(name)
        @name = name
        @songs = []
    end

    def each
        @songs.each { | song | yield song}
    end

    def add_song(song)
        @songs << song
    end

    def play_songs
        each { | song | song.play }
    end
end

my_playlist = Playlist.new("fancy")
my_playlist.add_song(song1)
my_playlist.add_song(song2)
my_playlist.add_song(song3)

# my_playlist.each { | song | song.play }

my_playlist.play_songs

