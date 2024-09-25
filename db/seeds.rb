# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# db/seeds.rb
# db/seeds.rb

# db/seeds.rb
require 'open-uri'

Booking.destroy_all
Good.destroy_all
User.destroy_all
puts "🌟 Seeding Game of Thrones Users..."

# User photos (using URLs)
jon_photo_url = "https://i0.wp.com/thedailycougar.com/wp-content/uploads/2019/04/jon-snow.jpg?w=1000&ssl=1"
daenerys_photo_url = "https://upload.wikimedia.org/wikipedia/en/0/0d/Daenerys_Targaryen_with_Dragon-Emilia_Clarke.jpg?20171223061132"
tyrion_photo_url = "https://external-preview.redd.it/_E5YaUD35cpOvvZx6hCH-HEFlKVklUjsGEIn29ozBR4.jpg?width=1080&crop=smart&auto=webp&s=33867c1872e423f18c382a6f82b2b6e2a26cee69"
cersei_photo_url = "https://miro.medium.com/v2/resize:fit:3736/format:webp/1*x0zpYvF2InN0CWMx3ZFqHw.jpeg"

jon = User.create!(
  first_name: "Jon",
  last_name: "Snow",
  house_name: "Stark",
  email: "jon.snow@got.com",
  password: "kinginthenorth"
)
jon.photo.attach(io: URI.open(jon_photo_url), filename: 'jon_snow.jpg')
puts "🦊 #{jon.first_name} #{jon.last_name} from House #{jon.house_name} has been created with an image."

daenerys = User.create!(
  first_name: "Daenerys",
  last_name: "Targaryen",
  house_name: "Targaryen",
  email: "daenerys@got.com",
  password: "dragonsarecool"
)
daenerys.photo.attach(io: URI.open(daenerys_photo_url), filename: 'daenerys_targaryen.jpg')
puts "🐉 #{daenerys.first_name} #{daenerys.last_name} from House #{daenerys.house_name} has been created with an image."

tyrion = User.create!(
  first_name: "Tyrion",
  last_name: "Lannister",
  house_name: "Lannister",
  email: "tyrion@got.com",
  password: "wineandwisdom"
)
tyrion.photo.attach(io: URI.open(tyrion_photo_url), filename: 'tyrion_lannister.jpg')
puts "🍷 #{tyrion.first_name} #{tyrion.last_name} from House #{tyrion.house_name} has been created with an image."

cersei = User.create!(
  first_name: "Cersei",
  last_name: "Lannister",
  house_name: "Lannister",
  email: "cersei@got.com",
  password: "queenofwesteros"
)
cersei.photo.attach(io: URI.open(cersei_photo_url), filename: 'cersei_lannister.jpg')
puts "👑 #{cersei.first_name} #{cersei.last_name} from House #{cersei.house_name} has been created with an image."

puts "\n🛒 Seeding Game of Thrones Goods..."

# Good photos (using URLs)
# dragons_photo_url = "https://media.wired.com/photos/5ada3a2c1e66870735eada27/master/w_1920,c_limit/DragonPasswordFINAL.jpg"
# iron_throne_photo_url = "https://media.wired.com/photos/5a5c7990ae3b7433d348beb1/master/w_1600%2Cc_limit/throne-big.jpg"
# wine_photo_url = "https://s.yimg.com/ny/api/res/1.2/GJtxe.S6JxVgBYi_bCpTOQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk0MDtoPTU0NQ--/https://media.zenfs.com/en-US/homerun/inquisitr_395/3073d3d88a5263d30044a82c12c2ca36"

valyrian_sword = Good.create!(
  name: "Valyrian Steel Sword",
  description: "A sword made of Valyrian steel, sharp enough to slice through anything.",
  price: 5000,
  user_id: jon.id
  )
  valyrian_sword_photo_url = "https://media.wired.com/photos/5ada3a2c1e66870735eada27/master/w_1920,c_limit/DragonPasswordFINAL.jpg"
  valyrian_sword.photo.attach(io: URI.open(valyrian_sword_photo_url), filename: 'the_sword.png')
# valyrian_sword.photo.attach(io: URI.open(valyrian_sword_photo_url), filename: 'valyrian_sword.jpg')
puts "⚔️ #{valyrian_sword.name} is now available in the marketplace, offered by #{jon.first_name}."

dragons = Good.create!(
  name: "Dragons",
  description: "A trio of fearsome dragons: Drogon, Rhaegal, and Viserion.",
  price: 10000,
  user_id: daenerys.id
)
dragons.photo.attach(io: URI.open(valyrian_sword_photo_url), filename: 'the_sword.png')
puts "🔥 #{dragons.name} are now available, offered by #{daenerys.first_name}."

iron_throne = Good.create!(
  name: "Iron Throne",
  description: "The throne made of swords, for those who wish to rule Westeros.",
  price: 20000,
  user_id: cersei.id
)
iron_throne.photo.attach(io: URI.open(valyrian_sword_photo_url), filename: 'the_sword.png')
puts "🪑 The #{iron_throne.name} is now available for booking, offered by #{cersei.first_name}."

wine = Good.create!(
  name: "Dornish Red Wine",
  description: "A fine vintage wine from Dorne, perfect for all occasions.",
  price: 200,
  user_id: tyrion.id
)
wine.photo.attach(io: URI.open(valyrian_sword_photo_url), filename: 'the_sword.png')
puts "🍇 #{wine.name} is now available for connoisseurs, offered by #{tyrion.first_name}."

puts "\n📅 Seeding Bookings..."

Booking.create!(
  total_price: 35000,
  start_date: Date.today,
  end_date: Date.today + 2,
  good_id: iron_throne.id,
  user_id: jon.id,
  status: 1,
  created_at: Time.now,
  updated_at: Time.now
)
puts "🤴 #{jon.first_name} has booked the #{iron_throne.name} for 2 days. Total Price: 35,000 Gold."

Booking.create!(
  total_price: 30000,
  start_date: Date.today,
  end_date: Date.today + 3,
  good_id: dragons.id,
  user_id: tyrion.id,
  status: 0,
  created_at: Time.now,
  updated_at: Time.now
)
puts "🐲 #{tyrion.first_name} has a pending booking for #{dragons.name} for 3 days. Total Price: #{Booking.last.total_price}"

puts "\n🌟 Seeding completed successfully!"
