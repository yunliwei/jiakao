class ProgresController < ApplicationController
  before_action :check_login
  before_action :set_progre, only: [:show, :edit, :update, :destroy]

  # GET /progres
  # GET /progres.json
  def index
    @progres = Progre.all
  end

  # GET /progres/1
  # GET /progres/1.json
  def show
  end

  # GET /progres/new
  def new
    @progre = Progre.new
  end

  # GET /progres/1/edit
  def edit
  end

  # POST /progres
  # POST /progres.json
  def create
    @progre = Progre.new(progre_params)

    respond_to do |format|
      if @progre.save
        format.html { redirect_to @progre, notice: 'Progre was successfully created.' }
        format.json { render :show, status: :created, location: @progre }
      else
        format.html { render :new }
        format.json { render json: @progre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progres/1
  # PATCH/PUT /progres/1.json
  def update
    respond_to do |format|
      if @progre.update(progre_params)
        format.html { redirect_to @progre, notice: 'Progre was successfully updated.' }
        format.json { render :show, status: :ok, location: @progre }
      else
        format.html { render :edit }
        format.json { render json: @progre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progres/1
  # DELETE /progres/1.json
  def destroy
    @progre.destroy
    respond_to do |format|
      format.html { redirect_to progres_url, notice: 'Progre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progre
      @progre = Progre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progre_params
      params.fetch(:progre, {})
    end
end
