require 'spec_helper'

describe LineItemsController do

	subject{page}

	describe "guest user" do
		let(:product){FactoryGirl.create(:product)}
		let(:user){FactoryGirl.create(:user)}
		let(:admin){FactoryGirl.create(:admin)}

		before(:each) do
			visit login_path
			fill_in "Email", 	with: admin.email 
			fill_in "Password",	with: admin.password
			click_button "Log in"
			visit new_product_path
			attach_file('product[image]', "#{Rails.root}/spec/fixtures/rails.png")
			fill_in "product[name]", 			with: "Awesome Product"
			fill_in "product[description]",		with: "This is an awesome product."
			fill_in "product[price]",			with: 30.00
			select('Apparel', :from => 'product[product_category_id]')
			click_button "Create Product"
			visit new_product_path
			attach_file('product[image]', "#{Rails.root}/spec/fixtures/blackbox.jpg")
			fill_in "product[name]", 			with: product.name
			fill_in "product[description]",		with: product.description
			fill_in "product[price]",			with: product.price
			select('Apparel', :from => 'product[product_category_id]')
			click_button "Create Product"
			visit settings_path
			click_button "logout"
			visit shop_path
		end

		it "should not add item to cart" do
			first(".product-list > li").click_button("Add to Cart")
			expect(page).to have_content("Login")
			expect(page).to have_content("Added")
			expect(page).to have_content("to cart.")
		end

		it "should increase quantity if item is already in cart" do
			first(".product-list > li").click_button("Add to Cart")
			visit shop_path
			first(".product-list > li").click_button("Add to Cart")
			expect(page).to have_selector('.qty', text: "2")
			expect(page).to have_content("Updated")
			expect(page).to have_content("quantity in cart.")
		end

	end

end