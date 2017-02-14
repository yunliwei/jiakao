class TopavatarsController < ApplicationController
  before_action :check_login
  before_action :set_topavatar, only: [:show, :edit, :update, :destroy]
  def index
    @topavatars = Topavatar.all
  end

  def new
    @topavatar=Topavatar.new
  end

  def create
    @topavatar=Topavatar.new(topavatar_params)
    @topavatar.save
    redirect_to topavatars_path
  end

  def update
    @topavatar.update(topavatar_params)
    redirect_to topavatars_path
  end

  def destroy
    @topavatar.destroy
    redirect_to topavatars_path
  end

  private
  def set_topavatar
    @topavatar = Topavatar.find(params[:id])
  end

  def topavatar_params
    params.require(:topavatar).permit(:topavatar, :link)
  end

end
