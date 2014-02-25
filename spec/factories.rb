FactoryGirl.define do 
	factory :user do
		sequence(:email)				{Forgery::Internet.email_address}
		password						"password"
		password_confirmation			"password"
		fullname						"Some Guy"
	end

	factory :admin, class: User do
		sequence(:email)				{Forgery::Internet.email_address}
		password						"password"
		password_confirmation			"password"
		fullname						"Admin"
		admin 							true
	end

	factory :post do
		title		"A title"
		body		"Some awesome stuff happening here"
		admin
	end

	factory :product do
		name			"Some Product"
		description		"This product is awesome"
		price			300
		downloadable	false
	end
end