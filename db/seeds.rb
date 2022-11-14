# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

5.times do
  puts 'Creating movie....'
  new_movie = Movie.create!(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    poster_url: Faker::Internet.url,
    rating: rand(1.0..5.0).round(1)
  )

  puts 'Creating list....'
  new_list = List.create!(
    name: Faker::Name.name
  )

  puts 'Creating bookmark...'
  Bookmark.create!(
    list: new_list,
    movie: new_movie,
    comment: Faker::Lorem.sentence
  )
end
