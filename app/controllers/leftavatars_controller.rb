class LeftavatarsController < ApplicationController

  before_action :check_login
  before_action :set_leftavatar, only: [:show, :edit, :update, :destroy]
  def index
    @leftavatars = Leftavatar.all
  end

  def new
    @leftavatar=Leftavatar.new
  end

  def create
    @leftavatar=Leftavatar.new(leftavatar_params)
    @leftavatar.save
    redirect_to leftavatars_path
  end

  def update
    @leftavatar.update(leftavatar_params)
    redirect_to leftavatars_path
  end

  def destroy
    @leftavatar.destroy
    redirect_to leftavatars_path
  end

  private
  def set_leftavatar
    @leftavatar = Leftavatar.find(params[:id])
  end

  def leftavatar_params
    params.require(:leftavatar).permit(:leftavatar, :link)
  end

end
