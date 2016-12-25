class AnswersController < ApplicationController
  before_action :check_login
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    set_updatecheck
    @answer = Answer.new(answer_params)

    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    #redirect_to article_path(@article)
    redirect_to edit_question_path(@question)




  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    set_updatecheck
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    set_updatecheck
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to edit_question_path(@question), notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  def changeanswer
answer = Answer.find(params[:change])
    answer.isright=params[:status].to_i
    answer.save
  end

  def createanswer
    Answer.create(question_id:params[:questionid],asnwer:params[:answer],isright:params[:isright])
    render json:('[{"status":"0"}]')
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:asnwer, :isright)
    end
end
