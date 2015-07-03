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

lists = []
lists << ShoppingList.create!(title: "רשימת קניות ראשונה שלי", user: yaniv)
lists << ShoppingList.create!(title: "רשימה דחופה!", user: alon)

Product.create!(title: "טבסקו", shopping_list: lists.sample, user: yaniv, measure: Measure.new(quantity: 1, unit: :units))
Product.create!(title: "ספרייט", shopping_list: lists.sample, user: yaniv, measure: Measure.new(quantity: 1.5, unit: :liters))
Product.create!(title: "קוטג'' 9%", shopping_list: lists.sample, user: alon, measure: Measure.new(quantity: 1, unit: :units))
Product.create!(title: "שיבולת שועל", shopping_list: lists.sample, user: alon, measure: Measure.new(quantity: 750, unit: :grams))
Product.create!(title: "קמח רגיל", shopping_list: lists.sample, user: yaniv, measure: Measure.new(quantity: 1, unit: :kilograms))


puts "Seed done"
puts "#{ShoppingList.count} Shopping Lists created"
puts "#{Product.count} Products created"