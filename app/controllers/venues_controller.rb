class VenuesController < InheritedResources::Base
	before_action :set_venue, only: [:edit, :update, :destroy]
	before_filter :authenticate_user!
	before_filter :verify_is_admin

	def create
		@venue = Venue.new(venue_params)
		respond_to do |format|
			if @venue.save
				format.html {redirect_to @venue, notice: "Venue created successfully."}
				format.json {render action: 'show', status: :created, location: @venue}
				format.js
		  	else
		  		format.html {render action: 'new'}
				format.json {render json: @venue.errors, status: :unprocessable_entity}
				format.js 	{render action: 'new'}
		  	end
		end
	end

	def new
		@venue = Venue.new
	end

	def update
		if @venue.update(venue_params)
			# to handle multiple images upload on update when user add more picture
			flash[:notice] = "venue has been updated."
			redirect_to @venue
		else
			render :edit
		end
	end

	def destroy
		@venue.destroy
		respond_to do |format|
			format.html { redirect_to new_venue_path }
			format.json { head :no_content }
		end
	end

	private
		def set_venue
			@venue = Venue.find(params[:id])
		end

		def venue_params
			params.require(:venue).permit(:name, :address, :address2, :city, :state, :zipcode, :country)
		end


		def verify_is_admin
			unless current_user.admin?
				redirect_to(root_path)
				flash[:warning] = "You do not have permission to carry out this function"
			end
		end
end
