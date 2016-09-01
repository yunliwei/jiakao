class ReturnjsonsController < ApplicationController

  def getquestion
    @questions = Question.where(isnew:'0')
    render json:(@questions)
  end

  def getanswer
    @answers=Answer.all
    render json:(@answers)
  end

  def updatecheck
    @updatecheck = Updatecheck.all
    render json:(@updatecheck)
  end

  def chapter
    @chapters = Chapter.all
    render json:(@chapters)
  end

  def subject
    @subjects = Subject.all

    render json:(@subjects)
  end


end
