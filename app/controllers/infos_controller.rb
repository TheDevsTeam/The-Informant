class InfosController < ApplicationController
  def index
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)
  end

  private
# this is so info is only permitted to add title and description
  def pin_params
    params.require(:info).permit(:title, :description)
  end


end
