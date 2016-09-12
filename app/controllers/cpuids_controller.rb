class CpuidsController < ApplicationController
  before_action :check_login
  before_action :set_cpuid, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index

    @cpuids = Cpuid.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @cpuid = Cpuid.new
  end

  # GET /chapters/1/edit
  def edit

  end

  # POST /chapters
  # POST /chapters.json
  def create
    @cpuid= Cpuid.new(cpuid_params)

    respond_to do |format|
      if @cpuid.save
        format.html { redirect_to cpuids_path, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @cpuid }
      else
        format.html { render :new }
        format.json { render json: @cpuid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @cpuid.update(cpuid_params)
        format.html { redirect_to createlicens_path, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpuid }
      else
        format.html { render :edit }
        format.json { render json: @cpuid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @cpuid.destroy
    respond_to do |format|
      format.html { redirect_to createlicenses_path, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cpuid
    @cpuid = Cpuid.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cpuid_params
    params.require(:cpuid).permit(:cpuid)
  end


end
