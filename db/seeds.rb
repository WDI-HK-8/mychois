# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Grocery.create([
  { name: 'Apple', price: '6.99', sale_price: '3.99'},
  { name: 'Kiwi', price: '7.99'},
  { name: 'Banana', price: '4.99'},
  { name: 'Yogurt', price: '7.99'},
  { name: 'Bread', price: '10.99'},
  { name: 'Milk', price: '10.99', sale_price: '7.99'},
  { name: 'Orange Juice', price: '20.99'},
  { name: 'Granola', price: '30.99'},
  { name: 'Granola Bar', price: '30.99'},
  { name: 'Eggs', price: '40.99'},
  { name: 'Oreos', price: '30.99'},
  { name: 'Coke - 6 pack', price: '35.99'},
  { name: 'Campbells Mushroom Soup', price: '5.99'},
  { name: 'Carrots', price: '8.99'},
  { name: 'Broccoli', price: '9.99'},
  { name: 'T-Bone Steak', price: '80.99'}])