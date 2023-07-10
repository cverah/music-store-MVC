require "faker"

# destroy all data
Song.destroy_all
Album.destroy_all
Artist.destroy_all
Customer.destroy_all

# Create 10 artists.
puts "Creating 10 artists"
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

# Create between 2 to 6 albums for each artist.
puts "Creating between 2 to 6 albums for each artist"
artists = Artist.all
# p artists.count
artists.each do |artist|
  rand(1..6).times do
    album = Album.create(
      name: Faker::Music.album,
      price: Faker::Commerce.price,
      duration: nil, 
      artist_id: artist.id
    )
    unless album.persisted?
      puts album.errors.full_messages.join(",")
      p album
    end
  end
end
puts "Finish creating between 2 to 6 albums for each artist"

# Create between 4 and 10 songs for each album.
puts "Create between 4 and 10 songs for each album."
albums = Album.all
albums.each do |album|
  rand(4..10).times do 
    song = Song.create(
      name: Faker::Music::RockBand.song,
      # number from 1 to 300
      duration: Faker::Number.between(from: 1, to: 300),
      album_id: album.id
    )
    unless song.persisted?
      puts song.errors.full_messages.join(",")
    end
  end
end
puts "Finished! Create between 4 and 10 songs for each album."

# Create 15 customers.
puts "Creating 15 customers"
15.times do
  first_name = Faker::Name.first_name
  name = first_name + " " + Faker::Name.last_name
  customer = Customer.create(
    username: Faker::Internet.username(specifier: name, separators: %w(. _ -)),
    email: Faker::Internet.unique.email(name: first_name),
    password: Faker::Internet.password,
    name: name,
    active: true
  )
  unless customer.persisted?
    puts customer.errors.full_messages.join(",")
  end
end
puts "Finished! Creating 15 customers"

# Create between 1 and 5 orders for each customer.
puts "Creating between 1 and 5 orders for each customer"
customers = Customer.all
customers.each do |customer|
  rand(1..5).times do
    order = Order.create(
      date: Faker::Date.between(from: '2020-01-01', to: '2022-12-31'),
      total: 1,
      customer_id: customer.id
    )
    unless order.persisted?
      order.errors.full_messages.join(",")
      p order
    end
  end
end
puts "Finished! Creating between 1 and 5 orders for each customer"