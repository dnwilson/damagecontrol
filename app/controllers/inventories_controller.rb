class InventoriesController < ApplicationController
	before_filter :authenticate_user!, only: [:edit, :update]
	before_filter :verify_is_admin, only: [:edit, :update]

	def update
		@inventory = Inventory.find(params[:id])
		respond_to do |format|
         if @inventory.update_attributes(inventory_params)
            format.html {redirect_to panel_path}
            format.json {head :no_content}
            format.js
         else
            format.html {render action: "edit"}
            format.json {render json: @inventory.errors, status: :unprocessable_entity}
            format.js {render'inventories/edit'}
         end
      end
	end

	def edit
		@products = Product.all
		@inventory = Inventory.find(params[:id])
	end

	private
		
		def inventory_params
			params.require(:inventory).permit(:product_id, :xsmall, :small, 
				:medium, :large, :xlarge, :xxlarge)
		end

		def verify_is_admin
			unless current_user.admin?
				flash[:warning] = "You do not have permission to carry out this function"
				redirect_to(root_path)
			end
		end
end