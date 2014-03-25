class ProductsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
	before_filter :verify_is_admin, only: [:new, :create, :destroy, :edit, :update]

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
				format.html { redirect_to panel_path}
				format.json { render json: @product, status: :created, location: @product}
				format.js
			else
				format.html { render 'products/new'}
				format.json { render json: @products.errors, status: :unprocessable_entity}
				format.js   { render 'products/new'}
			end
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		respond_to do |format|
         if @product.update_attributes(product_params)
            format.html {redirect_to shop_path}
            format.json {head :no_content}
            format.js
         else
            format.html {render action: "edit"}
            format.json {render json: @product.errors, status: :unprocessable_entity}
            format.js {render'products/edit'}
         end
      end
	end

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	private
		
		def product_params
			params.require(:product).permit(:image, :name, :description, :product_category_id, :price, :downloadable)
		end

		def verify_is_admin
			unless current_user.admin?
				flash[:warning] = "You do not have permission to carry out this function"
				redirect_to(root_path)
			end
		end
end