class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_filter :verify_is_admin, only: [:new, :create, :edit, :update, :destroy]
  def index
  	@events = Event.all
  end

  def create
  	@event = Event.new(event_params)
  	respond_to do |format|
  		if @event.save
  			format.html {redirect_to @event, notice: "Event created successfully."}
			format.json {render action: 'show', status: :created, location: @event}
			format.js
	  	else
	  		format.html {render action: 'new'}
			format.json {render json: @events.errors, status: :unprocessable_entity}
			format.js 	{render action: 'new'}
	  	end
  	end
  end

  def new
  	@event = Event.new
  end

  def update
	if @event.update(event_params)
	# to handle multiple images upload on update when user add more picture
		flash[:notice] = "Event has been updated."
		redirect_to @event
	else
		render :edit
	end
  end

  def destroy
  	@event.destroy
  	respond_to do |format|
		format.html { redirect_to events_path }
		format.json { head :no_content }
	end
  end

  def show
  	@gallery = @event.gallery
  	@video = Video.new(other_params)
  end

  private
		def set_event
			@event = Event.find(params[:id])
		end

		def event_params
			params.require(:event).permit(:name, :description, :date, :venue, :address, :flyer, :city, :state, :zipcode)
		end

		def other_params
			{name: @event.name, description: @event.description, event_id: @event.id, date: @event.date}
		end


		def verify_is_admin
			unless current_user.admin?
				redirect_to(root_path)
				flash[:warning] = "You do not have permission to carry out this function"
			end
		end
end
