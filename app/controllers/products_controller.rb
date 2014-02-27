class ProductsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :destroy]
	before_filter :verify_is_admin, only: [:new, :create, :destroy]

	def new
		@product = Product.new
	end

	def create
		if current_user.admin?
			@product = Product.new(product_params)
		else
			flash[:warning] = "You do not have sufficient permission to carry out this function"
		end

		respond_to do |format|
			if @product.save
				format.html { redirect_to products_path}
				format.json { render json: @product, status: :created, location: @product}
				format.js
			else
				format.html { render 'products/new'}
				format.json { render json: @products.errors, status: :unprocessable_entity}
				format.js   { render 'products/new'}
			end
		end
	end

	def index
		@products = Product.all
	end
	

	private
		
		def product_params
			params.require(:product).permit(:image, :name, :description, :price, :downloadable)
		end

		def verify_is_admin
			unless current_user.admin?
				flash[:warning] = "You do not have permission to carry out this function"
				redirect_to(root_path)
			end
		end
end