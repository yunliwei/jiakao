class QuestionsController < ApplicationController
  before_action :check_login
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index

    @questions = Question.where(isnew:'0').all.order("updated_at DESC").paginate(page:params[:page],per_page:10)
    @chapters = Chapter.all
    #@questions = Question.paginate(page:params[:page],per_page:8)
    @questioncount=@questions.count
    @answers=Answer.all

  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    #@question = Question.new
    @question =Question.create(isnew:'1')
    redirect_to edit_question_path(@question)
  end

  # GET /questions/1/edit
  def edit

@answers = @question.answers
@chapters = Chapter.all
    @subjects=Subject.all
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    set_updatecheck
    respond_to do |format|
      #debugger
      if @question.update(question_params)
        # if @question.questiontype.to_s.include?('XZ')
        #   answers=@question.answers
        #   answers.create(asnwer:params[:an1][0],isright:params[:anv1][0])
        #   answers.create(asnwer:params[:an2][0],isright:params[:anv2][0])
        #   answers.create(asnwer:params[:an3][0],isright:params[:anv3][0])
        #   answers.create(asnwer:params[:an4][0],isright:params[:anv4][0])
        # end
        format.html { redirect_to questions_path, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    set_updatecheck
    delcladeatail=Classdetail.where(question_id: @question.id.to_s)
    delcladeatail.each do |del|
      del.destroy
    end

    #delcladeatail.destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def addquestion
    @questions = Question.where(isnew:'0').all.order("updated_at DESC").paginate(page:params[:page],per_page:10)
    @cla=Cla.find(params[:claid])
    @cladetails=@cla.classdetails
    set_updatecheck
  end

  def addin
    @cla=Cla.find(params[:claid])
    @cladetails=@cla.classdetails
    #@cladetails.each do|del|
    #  del.destroy
    #end
    questionid=params[:questionid].to_s.split(',')
    questionid.each do |q|
      temcladetails = Classdetail.where(['cla_id=? and question_id=?',params[:claid],q])
      if temcladetails.count==0
        @cladetails.create(question_id:q)
      end
    end
    set_updatecheck
    render json:('[{"status":"1"}]')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:questionname,:chapter_id,:subject_id, :isjudge, :questionimage, :voice, :driverlicensetype, :questiontype, :isnew)
    end
end
