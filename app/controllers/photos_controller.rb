class PhotosController < ApplicationController
	before_action :set_photo, only: [:show, :edit, :destroy]
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_filter :verify_is_admin, only: [:new, :create, :edit, :update, :destroy]
	
	def new
		@photo = Photo.new
	end

	def show
	end

	def create
		@gallery = Gallery.find(params[:photo][:gallery_id])
		if params[:images]
			params[:images].each do |image|
				@gallery.photos.create(image: image)
				@gallery.photos.each do |photo|
					@photo = Photo.find(photo.id)
				end
			end
		end
	end

	def destroy
		@gallery = @photo.gallery
		@photo.destroy
	end

	private
		def set_photo
			@photo = Photo.find(params[:id])
		end

		def photo_params
			params.require(:photo).permit(:image, :name)
		end

		def verify_is_admin
			unless current_user.admin?
				redirect_to(root_path)
				flash[:warning] = "You do not have permission to carry out this function"
			end
		end
end
