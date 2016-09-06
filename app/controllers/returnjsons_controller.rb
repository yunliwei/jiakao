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

  def getvalidate
    myuser = User.find_by_login(params[:login])
    myuuid=UUIDTools::UUID.timestamp_create
    if myuser
      myuser.remoteval=myuuid
      myuser.save
      if myuser.logintype=='0'
      render json:('[{"validate":"'+myuuid+'","value":"'+myuser.loginnumber.to_s+'","status":"'+myuser.status+'"}]')
      else
        render json:('[{"validate":"'+myuuid+'","value":"'+myuser.logintime.to_s+'","status":"'+myuser.status+'"}]')
        end
    end
  end

  def getuser
    login=params[:login]
    validate=params[:validate]
login = 'add86'
    myuser=User.find_by_login(login)
    myvalidate=::Digest::MD5.hexdigest(myuser.login+myuser.password+myuser.remoteval+'CLOUDTIMESOFT')

    myvalidate.to_s.upcase!    #if myvalidate == validate && Time.parse(myvalidate.updated_at)
    usertime= myuser.updated_at
    nowtime=Time.now
    if nowtime - DateTime.parse(usertime.to_s) < 10 && validate==myvalidate
    render json:(myuser)
    else
      render json:('[{"status":"error"}]')
      end

  end



end
