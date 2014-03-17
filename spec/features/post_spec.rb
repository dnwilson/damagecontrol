require 'spec_helper'

describe PostsController do

	subject{page}

	describe "GET new post page" do
		
		let(:user)  { FactoryGirl.create(:user) }
		let(:admin) { FactoryGirl.create(:admin) }

		it "should deny access to guest users" do
			visit new_post_path
			expect(page).to have_content("You need to sign in or sign up before continuing.")
		end

		describe "signed in users who are not admin" do
			before do
			  visit login_path
			  fill_in "Email", 		with: user.email 
			  fill_in "Password",	with: user.password
			  click_button "Log in"
			end

			it "should not allow access to new post page" do
				visit new_post_path
				expect(page).to have_content("You do not have permission")
			end
		end

		describe "signed in admin users" do
			before do
			  visit login_path
			  fill_in "Email", 		with: admin.email 
			  fill_in "Password",	with: admin.password
			  click_button "Log in"
			end

			it "should allow access to new post page" do
				visit new_post_path
				expect(page).to have_selector(".post-form")
			end

			describe "create post" do
				before do
					visit new_post_path
					fill_in "post[title]", 	with: "Awesome post"
					fill_in "post[body]",	with: "This is an awesome post."
				end

				it "should increment post count" do
					expect{click_button "Create Post"}.to change(Post, :count).by(1)
				end
			end
		end
	end
end