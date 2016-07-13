class InfosController < ApplicationController
  before_action :find_info, only: [:show, :edit, :update, :destroy]

  def indexd
    @infos = Info.all.order("created_at DESC")
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)

    if @info.save
      redirect_to @info, notice: "You have successfully created the new info"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @info.update(info_params)
      redirect_to @info, notice: "Info was successfully updated"
    else
      render 'edit'
  end

  def destroy\
    @info.destroy
    redirect_to root_path
  end

  private
# this is so info is only permitted to add title and description
  def pin_params
    params.require(:info).permit(:title, :description)
  end

  def find_info
    @info = Info.find(params[:id])
  end


end
