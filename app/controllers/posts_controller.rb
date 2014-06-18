class PostsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :destroy]
	before_filter :verify_is_admin, only: [:new, :create, :destroy]

	caches_action :index
	caches_action :show, layout: false

	def new
		@post = Post.new
		@categories = ProductCategory.all
	end

	def create
		if current_user.admin?
			@post = current_user.posts.build(post_params)
		else
			flash[:warning] = "You do not have permission to carry out this function"
		end

		respond_to do |format|
			if @post.save
				expire_action action: :index
				format.html {redirect_to posts_path}
				format.json {render json: @post, status: :created, location: @post}
				format.js
			else
				format.html {render 'posts/new'}
				format.json {render json: @posts.errors, status: :unprocessable_entity}
				format.js 	{render 'posts/new'}
			end
		end
	end

	def index
		@posts = Post.all
	end
	

	private
		def verify_is_admin
			unless current_user.admin?
				redirect_to(root_path)
				flash[:warning] = "You do not have permission to carry out this function"
			end
		end

		def post_params
			params.require(:post).permit(:title, :body)
		end
end