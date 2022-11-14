# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Movie.destroy_all
# List.destroy_all
# Bookmark.destroy_all

# 5.times do
#   puts 'Creating movie....'
#   new_movie = Movie.create!(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     poster_url: Faker::Internet.url,
#     rating: rand(1.0..5.0).round(1)
#   )

#   puts 'Creating list....'
#   new_list = List.create!(
#     name: Faker::Name.name
#   )

#   puts 'Creating bookmark...'
#   Bookmark.create!(
#     list: new_list,
#     movie: new_movie,
#     comment: Faker::Lorem.sentence
#   )
# end

require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"
5.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/w300"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['poster_path']}",
      rating: movie['vote_average']
    )
  end
end
puts "Movies created"

puts 'Creating list....'
new_list = List.create!(
  name: 'Drama'
)
