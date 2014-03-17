FactoryGirl.define do 
	factory :user do
		sequence(:email)				{Forgery::Internet.email_address}
		password						"password"
		password_confirmation			"password"
		first_name						"Some"
		last_name						"Guy"
	end

	factory :admin, class: User do
		sequence(:email)				{Forgery::Internet.email_address}
		password						"password"
		password_confirmation			"password"
		first_name						"Admin"
		last_name						"Admin"
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
		product_category_id		[1, 2, 3].sample
		downloadable	false
	end
end