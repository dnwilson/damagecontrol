class MembersController < ApplicationController
	before_filter :authenticate_user!, only: [:edit, :update]
	before_filter :verify_is_admin, only: [:edit, :update]

	caches_action :index
	caches_action :show, layout: false

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		respond_to do |format|
			if @member.update_attributes(member_params)
				format.html {redirect_to member_path}
				format.json {head :no_content}
				format.js
			else
				format.html {render action: "edit"}
				format.json {render json: @member.errors, status: :unprocessable_entity}
				format.js {render'member/edit'}
			end
		end
	end

	private
		def member_params
			params.require(:member).permit(:name, :title, :bio, :photo, :facebook, :twitter, :instagram, :soundcloud, :youtube, :reverbnation)
		end

		def verify_is_admin
			unless current_user.admin?
				flash[:warning] = "You do not have permission to carry out this function"
				redirect_to(root_path)
			end
		end
end
