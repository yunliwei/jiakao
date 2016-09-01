class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    #require 'md5'
    @mycpu=::Digest::MD5.hexdigest('BFEBBFFF000306C4:20161201:1:CLOUDTIMESOFT')#bfebfbff000306c3

    #c12c-7881-d171-03e5
    #BF3E-A5AC-9455-EDE4
    #5c824ae9d86c37e1db5812b5583769df
    #b5197056ce8c70bc81f489283f149e81
    #464b    71841d6842377b94c467ea267558
    #7542670a3cf536689ec3907bb112e57a
    #5C82-B519-464B-7542
    #f345c094be13e1650214c2bfd12712cd
#d600-384f-9969-987f
#8180-0320-5227-611e
#bcb1-abba-c612-776a
#be11-e165-0214-c2bf
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :password, :head, :studentid, :sex, :age, :idcard, :name, :money, :model, :Subject, :logintype, :loginnumber, :logintime, :status)
    end
end
