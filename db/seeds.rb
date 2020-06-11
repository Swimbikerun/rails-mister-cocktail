# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all
Cocktail.create(name: "Margarita")
Cocktail.create(name: "Gin Tonic")
Cocktail.create(name: "Rhum")
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

url= "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
doc = open(url).read
user = JSON.parse(doc)

user["drinks"].each do |ingredient|
  new_ingredient = Ingredient.new(name: ingredient["strIngredient1"])
  new_ingredient.save!
end


