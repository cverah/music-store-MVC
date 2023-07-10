require "faker"

# Create 10 artists.
puts "Creating 10 artists"
artist = Artist.all
# p artist.first.nationality
10.times do
  birth_date =  Faker::Date.birthday(min_age: 18, max_age: 90)
  artist = Artist.create(
    name: Faker::Music.band,
    nationality: Faker::Address.country,
    birth_date: birth_date,
    # death date mas 18 years
    death_date: Faker::Date.between(from: birth_date +18 *365, to: Date.today),
    biography: Faker::Music.genre
  )
  unless artist.persisted?
    puts artist.errors.full_messages.join(",")
    p artist
  end
end

puts "Finished! Creating 10 artists"

