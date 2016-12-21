class ErrquestsController < ApplicationController
  before_action :check_login
  before_action :set_errquest, only: [:show, :edit, :update, :destroy]

  # GET /errquests
  # GET /errquests.json
  def index
    @errquests = Errquest.all.order("updated_at DESC").paginate(page:params[:page],per_page:15)
    @users =User.all
    @questions= Question.all
    @errcounts =@errquests.count

  end

  def errcount
    @questions= Question.all
    errs=Errquest.all

    @errcounts=Array.new
    errs.each do |err|
      flag = false
      for i in 0..@errcounts.count()-1
        flagerr=Hash.new
        if @errcounts.count()>0
          if @errcounts[i][:question].to_i == err.question_id.to_i
            flagerr={question:@errcounts[i][:question],amount:@errcounts[i][:amount].to_i+err.amount}
            @errcounts[i]=flagerr
            flag = true
            break
          end
        end
      end
      if !flag
        myerr=Hash.new
        myerr={question:err.question_id,amount:err.amount}
        @errcounts.push(myerr)
      end
    end
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
      params.require(:errquest).permit(:amount,:user_id,:question_id)
    end

  class Myerr
    def question

    end
    def amount

    end
  end

end
