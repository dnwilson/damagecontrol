require 'spec_helper'

describe ProductsController do

	subject{page}

	describe "GET new products page" do
		
		let(:user)  { FactoryGirl.create(:user) }
		let(:admin) { FactoryGirl.create(:admin) }

		it "should deny access to guest users" do
			visit new_product_path
			expect(page).should have_content("You need to sign in or sign up before continuing.")
		end

		describe "signed in users who are not admin" do
			before do
			  visit login_path
			  fill_in "Email", 		with: user.email 
			  fill_in "Password",	with: user.password
			  click_button "Log in"
			end

			it "should not allow access to new product page" do
				visit new_product_path
				page.should have_content("You do not have permission")
			end
		end

		describe "signed in admin users" do
			before do
			  visit login_path
			  fill_in "Email", 		with: admin.email 
			  fill_in "Password",	with: admin.password
			  click_button "Log in"
			end

			it "should allow access to new product page" do
				visit new_product_path
				page.should have_selector(".product-form")
			end

			describe "create a product" do
				before do
				  visit new_product_path
				  fill_in "Prod name", 				with: "Awesome Product"
				  fill_in "Prod description",		with: "This is an awesome product."
				  fill_in "Prod price",				with: 3.00
				end

				it "should create a new product" do
					expect{click_button "Create Product"}.to change(Product, :count).by(1)
				end
			end
		end
	end
end