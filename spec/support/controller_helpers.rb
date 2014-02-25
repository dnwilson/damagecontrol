module ControllerHelpers
	#Returns the full title on a per page basis
	def full_title(page_title)
		base_title = "Damage Control"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
	
	def login_admin
		before(:each) do
		  @request.env["devise.mapping"] = Devise.mappings[:admin]
		  sign_in FactoryGirl.create(:admin) # Using factory girl as an example
		end
	end

	def login_user
		before(:each) do
		  @request.env["devise.mapping"] = Devise.mappings[:user]
		  user = FactoryGirl.create(:user)
		  user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
		  sign_in user
		end
	end
end