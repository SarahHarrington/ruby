# class Snack
#     attr_reader :name, :carbs

#     def initialize(name, carbs)
#         @name = name
#         @carbs = carbs
#     end
# end

# This is a struct, actsd like we're creating a class
# :name & :carbs are symbols
Snack = Struct.new(:name, :carbs)

module SnackBar
    SNACKS = [
        Snack.new(:popcorn, 20),
        Snack.new(:junior_mints, 15),
        Snack.new(:nachos, 10),
        Snack.new(:pretzel, 18)
    ]

    def self.random
        SNACKS.sample
    end
end

