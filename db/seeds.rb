# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts ":star2: Seeding Game of Thrones Users..."
jon = User.create!(
  first_name: "Jon",
  last_name: "Snow",
  house_name: "Stark",
  email: "jon.snow@got.com",
  password: "kinginthenorth"
)
puts ":fox_face: #{jon.first_name} #{jon.last_name} from House #{jon.house_name} has been created."
daenerys = User.create!(
  first_name: "Daenerys",
  last_name: "Targaryen",
  house_name: "Targaryen",
  email: "daenerys@got.com",
  password: "dragonsarecool"
)
puts ":dragon: #{daenerys.first_name} #{daenerys.last_name} from House #{daenerys.house_name} has been created."
tyrion = User.create!(
  first_name: "Tyrion",
  last_name: "Lannister",
  house_name: "Lannister",
  email: "tyrion@got.com",
  password: "wineandwisdom"
)
puts ":wine_glass: #{tyrion.first_name} #{tyrion.last_name} from House #{tyrion.house_name} has been created."
cersei = User.create!(
  first_name: "Cersei",
  last_name: "Lannister",
  house_name: "Lannister",
  email: "cersei@got.com",
  password: "queenofwesteros"
)
puts ":crown: #{cersei.first_name} #{cersei.last_name} from House #{cersei.house_name} has been created."
puts "\n:shopping_trolley: Seeding Game of Thrones Goods..."
valyrian_sword = Good.create!(
  name: "Valyrian Steel Sword",
  description: "A sword made of Valyrian steel, sharp enough to slice through anything.",
  price: 5000,
  user_id: jon.id
)
puts ":crossed_swords: #{valyrian_sword.name} is now available in the marketplace, offered by #{jon.first_name}."
dragons = Good.create!(
  name: "Dragons",
  description: "A trio of fearsome dragons: Drogon, Rhaegal, and Viserion.",
  price: 10000,
  user_id: daenerys.id
)
puts ":fire: #{dragons.name} are now available, offered by #{daenerys.first_name}."
iron_throne = Good.create!(
  name: "Iron Throne",
  description: "The throne made of swords, for those who wish to rule Westeros.",
  price: 20000,
  user_id: cersei.id
)
puts ":chair: The #{iron_throne.name} is now available for booking, offered by #{cersei.first_name}."
wine = Good.create!(
  name: "Dornish Red Wine",
  description: "A fine vintage wine from Dorne, perfect for all occasions.",
  price: 200,
  user_id: tyrion.id
)
puts ":grapes: #{wine.name} is now available for connoisseurs, offered by #{tyrion.first_name}."
puts "\n:date: Seeding Bookings..."
Booking.create!(
  duration: 7,
  total_price: 35000,
  start_date: Date.today,
  good_id: iron_throne.id,
  user_id: jon.id,
  status: 1,
  created_at: Time.now,
  updated_at: Time.now
)
puts ":prince: #{jon.first_name} has booked the #{iron_throne.name} for 7 days. Total Price: 35,000 Gold."
Booking.create!(
  duration: 3,
  total_price: 30000,
  start_date: Date.today,
  good_id: dragons.id,
  user_id: tyrion.id,
  status: 0,
  created_at: Time.now,
  updated_at: Time.now
)
puts ":dragon_face: #{tyrion.first_name} has a pending booking for #{dragons.name} for 3 days. Total Price: 30,000 Gold."
Booking.create!(
  duration: 1,
  total_price: 5000,
  start_date: Date.today,
  good_id: valyrian_sword.id,
  user_id: daenerys.id,
  status: 1,
  created_at: Time.now,
  updated_at: Time.now
)
puts ":crossed_swords: #{daenerys.first_name} has confirmed her booking of the #{valyrian_sword.name} for 1 day. Total Price: 5,000 Gold."
Booking.create!(
  duration: 5,
  total_price: 1000,
  start_date: Date.today,
  good_id: wine.id,
  user_id: cersei.id,
  status: 0,
  created_at: Time.now,
  updated_at: Time.now
)
puts ":wine_glass: #{cersei.first_name} has a pending booking for #{wine.name} for 5 days. Total Price: 1,000 Gold."
puts "\n:star2: Seeding completed successfully!"
