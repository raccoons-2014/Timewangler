# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  TimePeriod.create(name: Faker::Lorem.word)
end


30.times do
  HeroCard.create(name: Faker::Name.name, time_period_id: rand(1..5), description: Faker::Lorem.sentence, strength: rand(1..5), intelligence: rand(1..5), charisma: rand(1..5))
end


deck1 = Deck.create(user_id: 1)
deck2 = Deck.create(user_id: 2)

HeroCard.where(:id => 1..15).each do |hero|
	deck1.deck_card_relationships.create(hero_card: hero)
end

HeroCard.where(:id => 16..30).each do |hero|
	deck2.deck_card_relationships.create(hero_card: hero)
end