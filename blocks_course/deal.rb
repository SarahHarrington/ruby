def deal
    faces = ["Jack", "Queen", "King", "Ace"]
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

    random_face = faces.sample
    random_suit = suits.sample
    score = yield(random_face, random_suit) if block_given?
    puts "the score is: #{score}"
end

# deal do | face, suit |
#     puts "Dealt a #{face} of #{suit}"
#     face.size + suit.size
# end

deal