# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.destroy_all # belongs to posts and Users
Sip.destroy_all # belongs to Users
User.destroy_all # can exist on its own
Location.destroy_all

#locations
ny = Location.create!(city: "New York")
dc = Location.create!(city: "DC")
sf = Location.create!(city: "San Francisco")
ms = Location.create!(city: "Tupelo")
nj = Location.create!(city: "Princeton")

# Users
paloma = User.create!(
  username: "awesome_person",
  location_id: dc.id,
  age: 9,
  fav_language: "Javascript",
  password: "starwars",
)

valerie = User.create!(
  username: "valerous",
  location_id: sf.id,
  age: 1200,
  fav_language: "Ruby",
  password: "starwars",
)

daniel = User.create!(
  username: "dan_the_man",
  location_id: sf.id,
  age: 5,
  fav_language: "CSS",
  password: "starwars",
)

megan = User.create!(
  username: "the_wizard",
  location_id: ny.id,
  age: 12,
  fav_language: "CSS",
  password: "starwars",
)

julia = User.create!(
  username: "juju",
  location_id: ny.id,
  age: 85,
  fav_language: "HTML",
  password: "starwars",
)

sam = User.create!(
  username: "sammy",
  location_id: ny.id,
  age: 999,
  fav_language: "SQL",
  password: "starwars",
)

david = User.create!(
  username: "talk_to_the_hand",
  location_id: nj.id,
  age: 1,
  fav_language: "Javascript",
  password: "starwars",
)

tahj = User.create!(
  username: "tahj_gets_buckets",
  location_id: ms.id,
  age: 65,
  fav_language: "Ruby",
  password: "starwars",
)

brad = User.create!(
  username: "beep_boop",
  location_id: ny.id,
  age: 3,
  fav_language: "SQL",
  password: "starwars",
)

greta = User.create!(
  username: "adventursaurus",
  location_id: ny.id,
  age: 4,
  fav_language: "Ruby",
  password: "starwars",
)

big_company = User.create!(
  username: "instructors_rock",
  location_id: ny.id,
  age: 100000,
  fav_language: "English",
  password: "starwars",
)

# sips
sip1 = Sip.create!(author_id: david.id, body: "Please use my messaging app, it's way better than Twitter.")
sip2 = Sip.create!(author_id: big_company.id, body: "Hello fellow instructors.")
sip3 = Sip.create!(author_id: big_company.id, body: "Have you seen this sweet instructor merch?")
sip4 = Sip.create!(author_id: tahj.id, body: "Sweeeeeet.")
sip5 = Sip.create!(author_id: julia.id, body: "Kahoots are an opportunity to mess with students.")

sip6 = Sip.create!(author_id: valerie.id, body: "Raaaaaiiiils.")
sip7 = Sip.create!(author_id: julia.id, body: "This is a random quote I found online. -Some person, 2020.")
sip8 = Sip.create!(author_id: tahj.id, body: "JavaScript is the best coding language.")

sip9 = Sip.create!(author_id: david.id, body: "Programmer: A machine that turns coffee into code.")
sip10 = Sip.create!(author_id: big_company.id, body: "You're a wizard, instructor.")

# Likes

# julia
Like.create!(liker_id: julia.id, sip_id: sip1.id)
Like.create!(liker_id: julia.id, sip_id: sip4.id)
Like.create!(liker_id: julia.id, sip_id: sip6.id)
Like.create!(liker_id: julia.id, sip_id: sip8.id)
Like.create!(liker_id: julia.id, sip_id: sip9.id)

# David
Like.create!(liker_id: david.id, sip_id: sip6.id)
Like.create!(liker_id: david.id, sip_id: sip7.id)
Like.create!(liker_id: david.id, sip_id: sip8.id)
Like.create!(liker_id: david.id, sip_id: sip4.id)

# sam
Like.create!(liker_id: sam.id, sip_id: sip4.id)
Like.create!(liker_id: sam.id, sip_id: sip5.id)
Like.create!(liker_id: sam.id, sip_id: sip8.id)

# tahj
Like.create!(liker_id: tahj.id, sip_id: sip5.id)
Like.create!(liker_id: tahj.id, sip_id: sip6.id)

# Big Company
Like.create!(liker_id: big_company.id, sip_id: sip1.id)
Like.create!(liker_id: big_company.id, sip_id: sip4.id)
Like.create!(liker_id: big_company.id, sip_id: sip5.id)
Like.create!(liker_id: big_company.id, sip_id: sip6.id)
Like.create!(liker_id: big_company.id, sip_id: sip7.id)
Like.create!(liker_id: big_company.id, sip_id: sip8.id)
Like.create!(liker_id: big_company.id, sip_id: sip9.id)
