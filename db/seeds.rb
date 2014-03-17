# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(first_name: "Admin", last_name: "Admin", email: "admin@damagecontrolfamily.com", password: "password", password_confirmation: "password", admin: true)
test = User.create!(first_name: "Test", last_name: "Tester", email: "test@tester.com", password: "password", password_confirmation: "password", admin: true)


ProductCategory.create!(name: "Apparel")
ProductCategory.create!(name: "Downloadable (Single)")
ProductCategory.create!(name: "Downloadable (Album)")