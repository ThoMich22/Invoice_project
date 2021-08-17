# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Client.destroy_all
Product.destroy_all
Invoice.destroy_all
Selection.destroy_all

10.times do
  Client.create(company_name: Faker::Company.name, first_name: Faker::Superhero.name, last_name: Faker::Superhero.suffix, adress: Faker::Address.full_address, phone_number: Faker::PhoneNumber.extension, mail: Faker::Movie.quote)
end