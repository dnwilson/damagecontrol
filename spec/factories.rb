FactoryGirl.define do 
	factory :user do
		sequence(:email)				{Forgery::Internet.email_address}
		password						"password"
		password_confirmation			"password"
		name							"Some Guy"
	end

	factory :admin, class: User do
		sequence(:email)				{Forgery::Internet.email_address}
		password						"password"
		password_confirmation			"password"
		name							"Admin"
		admin 							true
	end

	factory :post do
		post_title		"A title"
		post_content	"Some awesome stuff happening here"
		admin
	end

	factory :product do
		prod_name			"Some Product"
		prod_description	"This product is awesome"
		prod_price			300
		prod_downloadable	false
	end
end