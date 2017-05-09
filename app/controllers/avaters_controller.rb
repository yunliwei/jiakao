class AvatersController < ApplicationController

  before_action :check_login
  before_action :set_avater, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    #@admins = Admin.all

    temavatar=Avater.all
    if temavatar.count==0
      Avater.create(updated_at:Time.now)
    end
    @avater=Avater.first
    redirect_to edit_avater_path(@avater)
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      #debugger
      if @avater.update(avater_params)
        format.html { redirect_to edit_avater_path, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def chkrpt
    @admin=Admin.find_by_login(params[:login])
    if @admin
      json=false
    else
      json=true
    end
    #debugger
    respond_to do |format|
      format.js {render :text=>json}
    end
    #debugger
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_avater
    @avater = Avater.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def avater_params
    params.require(:avater).permit(:topavater ,:leftavater)
  end

end
