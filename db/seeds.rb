# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.delete_all
Review.delete_all

puts "Destroyed Old Records"

MULTIPLIER = 5

# Create Random Movies

(5 * MULTIPLIER).times do
  m = Movie.new
  m.title = Faker::Book.title
  m.release_date = Faker::Date.between(10.years.ago, Date.today)
  r = m.build_review
  r.reviewer_name = Faker::Name.name
  r.title = Faker::Company.catch_phrase
  r.review_text = Faker::Lorem.paragraph(5)
  r.review_date = Faker::Date.between(7.days.ago, Date.today)
  m.save!
end

puts "Movies and Reviews Created"
puts "COMPLETE!"