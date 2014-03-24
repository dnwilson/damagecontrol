# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(first_name: "Admin", last_name: "Admin", email: "admin@damagecontrolfamily.com", password: "password", password_confirmation: "password", admin: true)
test = User.create!(first_name: "Test", last_name: "Tester", email: "test@tester.com", password: "password", password_confirmation: "password", admin: true)

Member.create!(name: "Fiyah Damage", 
	artist: true, 
	title: "Founder/CEO, Artist", 
	bio: "My name is Fiyah.", 
	facebook: "fiyahdamage", 
	soundcloud: "fiyahdamage",
	youtube: "fiyahdamage",
	reverbnation: "",
	instagram: "fiyahdamage",
	twitter: "fiyahdamage",
	photo: File.open(File.join(Rails.root, 'team', 'member1.jpg'))
	)

Member.create!(name: "War Professa", 
	artist: true, 
	title: "Artist", 
	bio: "My name is War Professa.", 
	facebook: "warprofessa", 
	soundcloud: "warprofessa",
	youtube: "warprofessa",
	reverbnation: "warprofessa",
	instagram: "warprofessa",
	twitter: "warprofessa",
	photo: File.open(File.join(Rails.root, 'team', 'member2.jpg'))
	)
Member.create!(name: "Boyze", 
	artist: true, 
	title: "Artist, Dark-Side", 
	bio: "My name is Boyze.", 
	facebook: "boyzem", 
	soundcloud: "",
	youtube: "",
	reverbnation: "",
	instagram: "",
	twitter: "",
	photo: File.open(File.join(Rails.root, 'team', 'member3.jpg'))
	)
Member.create!(name: "K-ron", 
	artist: true, 
	title: "Artist, Dark-Side", 
	bio: "My name is K-ron.", 
	facebook: "kron.morgan", 
	soundcloud: "",
	youtube: "",
	reverbnation: "",
	instagram: "",
	twitter: "",
	photo: File.open(File.join(Rails.root, 'team', 'member4.jpg'))
	)
Member.create!(name: "Dappa Diesel", 
	artist: true, 
	title: "Artist", 
	bio: "My name is Dappa Diesel.", 
	facebook: "dappadiesel876", 
	soundcloud: "dappadiesel",
	youtube: "dappadiesel",
	reverbnation: "dappadiesel",
	instagram: "dappadiesel",
	twitter: "dappadiesel",
	photo: File.open(File.join(Rails.root, 'team', 'member5.jpg'))
	)
Member.create!(name: "Razor Damage", 
	artist: true, 
	title: "Promoter, Event Planner",
	facebook: "razordamage",
	photo: File.open(File.join(Rails.root, 'team', 'member6.jpg'))
	)
Member.create!(name: "Cardo Wicked", 
	artist: true, 
	title: "Dancer, Promoter, Dark-Side",
	facebook: "Card0Wicked",
	photo: File.open(File.join(Rails.root, 'team', 'member7.jpg'))
	)
Member.create!(name: "Jigga Damage", 
	artist: true, 
	title: "Promoter, Event Planner",
	facebook: "jigga.damage",
	photo: File.open(File.join(Rails.root, 'team', 'member8.jpg'))
	)
Member.create!(name: "Raydawg Damage", 
	artist: true, 
	title: "Street Team",
	facebook: "raymond.rowe.33",
	photo: File.open(File.join(Rails.root, 'team', 'member9.jpg'))
	)
Member.create!(name: "Repo", 
	artist: true, 
	title: "Street Team",
	facebook: "repo.frass",
	photo: File.open(File.join(Rails.root, 'team', 'member10.jpg'))
	)
Member.create!(name: "Terpi", 
	artist: true, 
	title: "Dancer, Dark-Side",
	facebook: "terpibond",
	photo: File.open(File.join(Rails.root, 'team', 'member11.jpg'))
	)
Member.create!(name: "TJ", 
	artist: true, 
	title: "Dancer, Dark-Side",
	facebook: "tj.wilson.18007",
	photo: File.open(File.join(Rails.root, 'team', 'member12.jpg'))
	)

ProductCategory.create!(name: "Apparel")
ProductCategory.create!(name: "Downloadable (Single)")
ProductCategory.create!(name: "Downloadable (Album)")