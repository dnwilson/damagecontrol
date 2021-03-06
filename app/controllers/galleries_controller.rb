class GalleriesController < ApplicationController
	before_action :set_gallery, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_filter :verify_is_admin, only: [:new, :create, :edit, :update, :destroy]
	
	caches_action :index

	def new
		@gallery = Gallery.new
	end

	def index
		@galleries = Gallery.all
	end

	def show
		@video = Video.new(other_params)
		@photo = Photo.new
        respond_to do |format|
            format.html # show.html.erb
            format.js
        end
	end

	def edit
	end

	def create
		@gallery = current_user.galleries.build(gallery_params)
		if @gallery.save
			# to handle multiple images upload on create
			if params[:images]
				params[:images].each { |image|
					@gallery.photos.create(image: image)
				}
				@gallery.preview_pic = @gallery.photos.sample.image
				@gallery.save
			end
			expire_action action: :index
			flash[:notice] = "Your gallery has been created."
			redirect_to @gallery
		else 
			flash[:alert] = "Something went wrong."
			render :new
		end
	end

	def update
		if @gallery.update(gallery_params)
		# to handle multiple images upload on update when user add more picture
			if params[:images]
				params[:images].each { |image|
					@gallery.photos.create(image: image)
					expire_action action: :show
				}
			end
			flash[:notice] = "Gallery has been updated."
			redirect_to @gallery
		else
			render :edit
		end
	end

	def destroy
		@gallery.destroy
		respond_to do |format|
			format.html { redirect_to galleries_url }
			format.json { head :no_content }
		end
	end
	
	private
		def set_gallery
			@gallery = Gallery.find(params[:id])
		end

		def other_params
			{name: @gallery.name, description: @gallery.description, event_id: @gallery.event_id, date: @gallery.date}
		end

		def gallery_params
			params.require(:gallery).permit(:name, :description, :preview_pic, :date, :event_id)
		end

		def verify_is_admin
			unless current_user.admin?
				redirect_to(root_path)
				flash[:warning] = "You do not have permission to carry out this function"
			end
		end
end