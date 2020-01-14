scores = [83, 71, 92, 64, 98, 87, 75, 69]

# high_scores = scores.select { |score| score > 80 }
# puts high_scores

# low_scores = scores.reject { | score | score > 80 }
# puts low_scores

# puts scores.any? {| score | score < 70}

# puts scores.find { | score | score < 70}

scores_doubled = scores.map { | score | score * 2 }
puts scores_doubled

total = scores.reduce { | total, score | total + score }
puts "Total score: #{total}"

evens, odds = scores.partition { |score| score.even? }
puts "Evens:"
puts evens

puts "Odds:"
puts odds