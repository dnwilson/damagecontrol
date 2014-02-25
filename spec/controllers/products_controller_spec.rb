# require 'spec_helper'

# include Warden::Test::Helpers

# Warden.test_mode!

# describe ProductsController do
# 	render_views

# 	describe "GET products page" do
# 		before do
# 		  visit new_product_path
# 		  no_capybara: true
# 		end
# 		it "should deny access to guest users" do
# 			expect(response).should redirect_to(login_path)
# 		end
# 	end
# end