class ErrquestsController < ApplicationController
  before_action :check_login
  before_action :set_errquest, only: [:show, :edit, :update, :destroy]

  # GET /errquests
  # GET /errquests.json
  def index
    @errquests = Errquest.all
  end

  # GET /errquests/1
  # GET /errquests/1.json
  def show
  end

  # GET /errquests/new
  def new
    @errquest = Errquest.new
  end

  # GET /errquests/1/edit
  def edit
  end

  # POST /errquests
  # POST /errquests.json
  def create
    @errquest = Errquest.new(errquest_params)

    respond_to do |format|
      if @errquest.save
        format.html { redirect_to @errquest, notice: 'Errquest was successfully created.' }
        format.json { render :show, status: :created, location: @errquest }
      else
        format.html { render :new }
        format.json { render json: @errquest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /errquests/1
  # PATCH/PUT /errquests/1.json
  def update
    respond_to do |format|
      if @errquest.update(errquest_params)
        format.html { redirect_to @errquest, notice: 'Errquest was successfully updated.' }
        format.json { render :show, status: :ok, location: @errquest }
      else
        format.html { render :edit }
        format.json { render json: @errquest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /errquests/1
  # DELETE /errquests/1.json
  def destroy
    @errquest.destroy
    respond_to do |format|
      format.html { redirect_to errquests_url, notice: 'Errquest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_errquest
      @errquest = Errquest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def errquest_params
      params.require(:errquest).permit(:amount)
    end
end
