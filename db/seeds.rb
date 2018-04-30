# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |i|
  movie = Movie.create(title: "The Martian ##{i}", user_id: 1, summary: "During a manned mission to Mars, Astronaut Mark Watney (Matt Damon) is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet. With only meager supplies, he must draw upon his ingenuity, wit and spirit to subsist and find a way to signal to Earth that he is alive. ")
  bad = Review.create(comment: "I didn't like it.", rating: 1, movie_id: movie.id, user_id: 1)
  good = Review.create(comment: "I loved it!", rating: 5, movie_id: movie.id, user_id: 1)
end

5.times do |i|
  movie = Movie.create(title: "The Martian ##{i}", user_id: 1, summary: "During a manned mission to Mars, Astronaut Mark Watney (Matt Damon) is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet. With only meager supplies, he must draw upon his ingenuity, wit and spirit to subsist and find a way to signal to Earth that he is alive. ")
  good = Review.create(comment: "I loved it!", rating: 5, movie_id: movie.id, user_id: 1)
end