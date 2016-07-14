class InfosController < ApplicationController
	before_action :find_info, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@infos = Info.all.order("created_at DESC")
	end

	def show
	end

	def new
		@info = current_user.infos.build
	end

	def create
		@info = current_user.infos.build(info_params)

		if @info.save
			redirect_to @info, notice: "Info was successfully created"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @info.update(info_params)
			redirect_to @info, notice: "Info was successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@info.destroy
		redirect_to root_path
	end

	def upvote
		@info.upvote_by current_user
		redirect_to :back
	end

	private

	def info_params
		params.require(:info).permit(:title, :description, :image)
	end

	def find_info
		@info = Info.find(params[:id])
	end

end
