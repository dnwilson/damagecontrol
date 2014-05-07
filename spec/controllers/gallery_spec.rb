require 'spec_helper'

describe GalleriesController do

	subject{page}

	describe "GET new gallery page" do
		
		let(:user)  { FactoryGirl.create(:user) }
		let(:admin) { FactoryGirl.create(:admin) }

		it "should deny access to guest users" do
			visit new_gallery_path
			expect(page).to have_content("You need to sign in or sign up before continuing.")
		end

		describe "when user signed in" do
			before do
			  visit login_path
			  fill_in "Email", 		with: user.email 
			  fill_in "Password",	with: user.password
			  click_button "Log in"
			end

			it "should not deny access" do
				visit new_gallery_path
				expect(page).to have_content("You do not have permission")
			end

			it "should have user name at panel path" do
				visit settings_path
				expect(page).to have_content("Welcome, #{user.first_name}")
			end
		end

		describe "when admin signed in" do
			before do
			  visit login_path
			  fill_in "Email", 		with: admin.email 
			  fill_in "Password",	with: admin.password
			  click_button "Log in"
			end

			it "should have user name at panel path" do
				visit panel_path
				expect(page).to have_content("Welcome, Admin")
			end

			it "should allow access" do
				visit new_gallery_path
				expect(page).to have_content("Welcome, Admin")
			end

			# describe "create a gallery" do
			# 	before do
			# 	  visit new_gallery_path
			# 	  # attach_file('gallery[image]', "#{Rails.root}/spec/fixtures/rails.png")
			# 	  fill_in "gallery[name]", 				with: "My Gallery"
			# 	  fill_in "gallery[description]",		with: "This is an awesome gallery."
			# 	end

			# 	it "should create a new gallery" do
			# 		expect{click_button "Create gallery"}.to change(Gallery, :count).by(1)
			# 	end

			# 	it "should redirect to index path" do
			# 		click_button "Create Gallery"
			# 		expect(page).to have_selector('.galleries')
			# 	end
			# end
		end

	end
end