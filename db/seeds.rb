# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

i = 1
79.times do
  if i > 9
  	desc = Faker::Creature::Cat.breed << " - " << Faker::Creature::Cat.registry
  	url = "http://thp.athanyl.net/kitten/kitten00" << i.to_s << ".jpg"
  	thumburl = "http://thp.athanyl.net/kitten/thumb/thumb00" << i.to_s << ".jpg"
  	myitems = Item.create!(title: Faker::Creature::Cat.name, description: desc, price: 0.01, image_url: url, thumb_url: thumburl)
	else
  	desc = Faker::Creature::Cat.breed + " - " + Faker::Creature::Cat.registry
  	url = "http://thp.athanyl.net/kitten/kitten000" << i.to_s << ".jpg"
  	thumburl = "http://thp.athanyl.net/kitten/thumb/thumb000" << i.to_s << ".jpg"		
		myitems = Item.create!(title: Faker::Creature::Cat.name, description: desc, price: 0.01, image_url: url, thumb_url: thumburl)
	end
	i += 1
end