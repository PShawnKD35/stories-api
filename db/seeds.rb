# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Story.destroy_all if Rails.env.development?

5.times do
  story = Story.new
  story.name = Faker::TvShows::GameOfThrones.character
  story.text = Faker::TvShows::GameOfThrones.quote
  story.save
end

15.times do
  comment = Comment.new
  comment.story_id = rand(1..Story.count)
  comment.name = Faker::TvShows::GameOfThrones.character
  comment.content = Faker::TvShows::GameOfThrones.quote
  comment.save
end