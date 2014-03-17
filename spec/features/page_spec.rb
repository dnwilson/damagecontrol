require 'spec_helper'

describe PagesController do

	subject{page}

	describe "GET home page" do
		let(:user)  { FactoryGirl.create(:user) }
		let(:admin) { FactoryGirl.create(:admin) }

		it "should have login option in navbar" do
			visit root_path
			expect(page).to have_selector("li", text: "Login")
		end
	end

	describe "GET panel page" do
		
		let(:user)  { FactoryGirl.create(:user) }
		let(:admin) { FactoryGirl.create(:admin) }

		it "should deny access to guest users" do
			visit settings_path
			expect(page).to have_content("You need to sign in or sign up before continuing.")
		end

		describe "signed in users" do
			before do
			  visit login_path
			  fill_in "Email", 		with: user.email 
			  fill_in "Password",	with: user.password
			  click_button "Log in"
			end

			it "should see welcome message and their name" do
				visit settings_path
				expect(page).to have_content("Welcome, #{user.first_name}")
			end

			it "nav bar should have panel link" do
				visit settings_path
				expect(page).to have_selector('li', text: "MyDC")
			end
		end

		describe "signed in admin" do
			before do
			  visit login_path
			  fill_in "Email", 		with: admin.email 
			  fill_in "Password",	with: admin.password
			  click_button "Log in"
			end

			it "greet them with a welcome message and their name" do
				visit settings_path
				expect(page).to have_content("Welcome, #{admin.first_name}")
			end

			it "nav bar should have panel link" do
				visit settings_path
				expect(page).to have_selector('li', text: "MyDC")
			end
		end

		# describe "signed in admin users" do
		# 	before do
		# 	  visit login_path
		# 	  fill_in "Email", 		with: admin.email 
		# 	  fill_in "Password",	with: admin.password
		# 	  click_button "Log in"
		# 	end

		# 	it "should allow access to new product page" do
		# 		visit new_product_path
		# 		page.should have_selector(".product-form")
		# 	end

		# 	describe "create a product" do
		# 		before do
		# 		  visit new_product_path
		# 		  attach_file('Image', "#{Rails.root}/spec/fixtures/rails.png")
		# 		  fill_in "Name", 				with: "Awesome Product"
		# 		  fill_in "Description",		with: "This is an awesome product."
		# 		  fill_in "Price",				with: 3.00
		# 		end

		# 		it "should create a new product" do
		# 			expect{click_button "Create Product"}.to change(Product, :count).by(1)
		# 		end

		# 		it "should have product image path" do
		# 			click_button "Create Product"
		# 			page.should have_css('img')
		# 		end

		# 		it "should redirect to index path" do
		# 			click_button "Create Product"
		# 			page.should have_selector('.product-list')
		# 		end
		# 	end
		# end
	end
end