class VideosController < ApplicationController
	before_action :set_video, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_filter :verify_is_admin, only: [:new, :create, :edit, :update, :destroy]
	def index
		@videos = Video.all
	end

	def create
		@video = Video.create(video_params)
		respond_to do |format|
			youtube_video_regex = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
			youtube_video = youtube_video_regex.match(params[:video][:url])[2]
			preview = "http://img.youtube.com/vi/#{youtube_video}/0.jpg"
			if @video.save
				@video.update(image: preview)
				flash[:notice] = "Video created successfully."
				format.html {redirect_to videos_path}
			format.json {render json: @video, status: :created, location: @video}
			format.js
	  	else
	  		format.html {render 'videos/new'}
			format.json {render json: @events.errors, status: :unprocessable_entity}
			format.js 	{render 'videos/new'}
	  	end
		end
	end

	def new
		@video = Video.new
	end

	def update
		if @video.update(video_params)
		# to handle multiple images upload on update when user add more picture
			flash[:notice] = "video has been updated."
			redirect_to @video
		else
			render :edit
		end
	end

	def destroy
		@video.destroy
		respond_to do |format|
		format.html { redirect_to videos_path }
		format.json { head :no_content }
	end
	end

	def show
	end

	private
		def add_video_image
			youtube_video_regex = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
			youtube_video = youtube_video_regex.match(params[:video][:url])[2]
			url = "http://img.youtube.com/vi/#{youtube_video}/3.jpg"
			url
		end
		def set_video
			@video = Video.find(params[:id])
		end

		def video_params
			params.require(:video).permit(:name, :description, :date, :image, :event_id, :url)
		end

		def verify_is_admin
			unless current_user.admin?
				redirect_to(root_path)
				flash[:warning] = "You do not have permission to carry out this function"
			end
		end
end
