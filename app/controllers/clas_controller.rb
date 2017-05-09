class ClasController < ApplicationController

  before_action :check_login
  before_action :set_cla, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
    @clas = Cla.all.order("updated_at DESC").paginate(page:params[:page],per_page:10)
    @subjects=Subject.all

  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @cla = Cla.new
    @subjects=Subject.all
  end

  # GET /chapters/1/edit
  def edit
    @subjects=Subject.all
    @cladetails=@cla.classdetails
    arr =  Array.new
@cladetails.each do |cladetail|
  arr.push(cladetail.question_id)
end
    @questions=Question.where(['id in(?)',arr])
  end

  # POST /chapters
  # POST /chapters.json
  def create
    set_updatecheck
    @cla = Cla.new(cla_params)
    respond_to do |format|
      if @cla.save
        format.html { redirect_to edit_cla_path(@cla), notice: 'cla was successfully created.' }
        format.json { render :show, status: :created, location: @cla }
      else
        format.html { render :new }
        format.json { render json: @cla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    set_updatecheck
    respond_to do |format|
      if @cla.update(cla_params)
        format.html { redirect_to clas_path, notice: 'Cla was successfully updated.' }
        format.json { render :show, status: :ok, location: @cla }
      else
        format.html { render :edit }
        format.json { render json: @cla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    set_updatecheck
    @cla.destroy
    respond_to do |format|
      format.html { redirect_to clas_url, notice: 'Cla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def validateflag
    flag =Cla.find_by_classflag(params[:classflag])
    if(flag!=nil)
      render json:('[{"status":"0"}]')
    else
      render json:('[{"status":"1"}]')
    end
  end

  def delquestion
    @delclassdetail=Cla.find(params[:claid]).classdetails
    @delclassdetail.each do |del|
      if del.question_id.to_s==params[:questionid].to_s
        del.destroy
      end
    end
    render json:('[{"status":"1"}]')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cla
    @cla = Cla.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cla_params
    params.require(:cla).permit(:cla,:cartype,:subject_id,:classflag,:questiontype,:name)
  end

end
