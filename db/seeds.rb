# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

yaniv = User.new(name: "Yaniv", email: "yaniv@test.com", password: "12341234")
yaniv.save!

alon = User.new(name: "Alon", email: "alon@test.com", password: "12341234")
alon.save!

users = User.all


ShoppingList.create!(title: "רשימת קניות ראשונה שלי", user: yaniv)
ShoppingList.create!(title: "רשימה דחופה!", user: alon)

lists = ShoppingList.all


Product.create!(title: "טבסקו", description: Faker::Lorem.sentence, shopping_list: lists.sample, user: yaniv, measure: Measure.new(quantity: 1, unit: :items))
Product.create!(title: "ספרייט", description: Faker::Lorem.sentence, shopping_list: lists.sample, user: yaniv, measure: Measure.new(quantity: 1.5, unit: :liters))
Product.create!(title: "קוטג' 9%", description: Faker::Lorem.sentence, shopping_list: lists.sample, user: alon, measure: Measure.new(quantity: 1, unit: :items))
Product.create!(title: "שיבולת שועל", description: Faker::Lorem.sentence, shopping_list: lists.sample, user: alon, measure: Measure.new(quantity: 750, unit: :grams))
Product.create!(title: "קמח רגיל", description: Faker::Lorem.sentence, shopping_list: lists.sample, user: yaniv, measure: Measure.new(quantity: 1, unit: :kilograms))

15.times do
  Product.create!(title: Faker::Commerce.product_name, description: Faker::Lorem.sentence, shopping_list: lists.sample, user: users.sample, measure: Measure.new(quantity: 1, unit: :items))
end


puts "Seed done"
puts "#{ShoppingList.count} Shopping Lists created"
puts "#{Product.count} Products created"


