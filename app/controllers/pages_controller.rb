class PagesController < ApplicationController
	before_filter :authenticate_user!, only: [:panel]
	before_filter :verify_is_admin, only: [:panel]

	def home
		@products = Product.all
		@members = Member.all
	end

	def panel
		@products = Product.all 
		@inventories = Inventory.all
		@members = Member.all
	end

	def about
		
	end

	def contact
		
	end

	private

		def verify_is_admin
			unless current_user.admin?
				flash[:warning] = "You do not have permission to carry out this function"
				redirect_to(root_path)
			end
		end

end