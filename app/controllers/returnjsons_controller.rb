class ReturnjsonsController < ApplicationController
  #after_action :getip, only: [:getuser]
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

        render json:('[{"number":"'+myuser.loginnumber.to_s+'","validate":"'+myuuid+'","time":"'+myuser.logintime.to_s+'","status":"'+myuser.status+'"}]')

    end
  end

  def getuser


    loc=''
    # location = getip(params[:ip])
    # location_json = JSON.parse(location)
    #
    #   begin
    #     loc = location_json['data']['region']+' '+location_json['data']['city']+' '+location_json['data']['county']+' '+location_json['data']['isp']
    #   rescue
    #     loc=''
    #   end




    login=params[:login]
    validate=params[:validate]
#login = 'add86'

    myuser=User.find_by_login(login)
    myvalidate=::Digest::MD5.hexdigest(myuser.login+myuser.password+myuser.remoteval+'CLOUDTIMESOFT')

    myvalidate.to_s.upcase!    #if myvalidate == validate && Time.parse(myvalidate.updated_at)
    usertime= myuser.updated_at
    nowtime=Time.now
    if nowtime - DateTime.parse(usertime.to_s) < 100 && validate==myvalidate
      render json:(myuser)
      #debugger

      #debugger
      #'http://apis.baidu.com/apistore/iplookupservice/iplookup?ip=117.89.35.58 -H apikey:6e1802f8c0cd1b42b32249ba42c2e602y'


      #location = getip(params[:ip])

      myuser.loginnumber= myuser.loginnumber.to_i - 1
      myuser.save

      Loginlog.create(user_id:myuser.id,ip:params[:ip],location:loc)
    else
      render json:('[{"status":"error"}]')
    end
    GetipJob.perform_later

  end



  def changepassword
    oldpassword=params[:oldpassword]
    newpassword=params[:newpassword]
    login=params[:login]
    user =User.find_by_login(login)
    hexpassword=::Digest::MD5.hexdigest(user.password).to_s.upcase!
    if hexpassword == oldpassword
      user.password=newpassword
      user.save
      render json:('[{"status":"密码修改成功！"}]')
    else
      render json:('[{"status":"原始密码不正确！"}]')
    end




  end


  def r_errquests

    errquestions = Errquest.where(user_id:params[:user_id])
    render json:(errquestions)

  end

  def t_errquests

    del = params[:command]
    questions =params[:q]
    amounts=params[:a]
    userid=params[:user_id]

    if del != nil
      delerr = Errquest.where(user_id:userid)
      delerr.each do |del|
        del.destroy
      end
    end
#debugger
    step=0
    Errquest.transaction do
    if(questions!=nil)
      questions.each do |f|
        Errquest.create(user_id:userid.to_i,question_id:f,amount:amounts[step])
        step=step+1
        #debugger
      end
    end
    end



    #debugger
     # Errquest.create(question_id:params[:login])
      render json:('[{"status":"原始密码不正确！"}]')
  end

  def del_errquests
    #questions=params[:q]
   # debuggerqu
    amount=params[:amount]
    userid=params[:user_id]
    if amount.to_s.include?'3'
    errquestion = User.find(userid).errquests.where(:amount=>3)
    end
    if(errquestion!=nil)
      errquestion.each do |del|
        del.destroy
      end
    end
    if amount.to_s.include?'2'
      errquestion = User.find(userid).errquests.where(2)
    end
    if(errquestion!=nil)
      errquestion.each do |del|
        del.destroy
      end
    end
    if amount.to_s.include?'1'
      errquestion = User.find(userid).errquests.where(1)
    end
    if(errquestion!=nil)
      errquestion.each do |del|
        del.destroy
      end
    end

    render json:('[{"status":"0"}]')

  end

  def reguser
    name=params[:name]
    password=params[:password]
    login=params[:login]
    phone=params[:phone]
    idcard=params[:idcard].to_s
    education=params[:education]
    studentid=params[:studentid]
    money=params[:money]
    sex=params[:sex]

    loginuser=User.find_by(login:login)
    if loginuser != nil
       render json:('[{"status":"0"}]')#账号已存在
    end

    phoneuser=User.find_by(phonenumber:phone)
    if phoneuser != nil
       render json:('[{"status":"1"}]')#手机号码已存在
    end

    if loginuser == nil && phoneuser == nil
      User.create(login:login,password:password,studentid:studentid,sex:sex,idcard:idcard,name:name,money:money,education:education,phonenumber:phone,status:'3')
       render json:('[{"status":"2"}]')#注册成功
    end

  end


  class Mycla
    attr :id,true
    attr :subject,true
    attr :classflag,true
    attr :questiontype,true
    attr :name,true
    attr :created_at,true
    attr :updated_at,true
    attr :cartype,true
  end


  def cla
    @class=Cla.all
    @subjects=Subject.all
    arr =Array.new
    @class.each do |cla|

      @subjects.each do |subject|
        if cla.subject_id==subject.id
          cla.subject_id=subject.subject
          mycla=Mycla.new
          mycla.id=cla.id
          mycla.subject=subject.subject
          mycla.classflag=cla.classflag
          mycla.questiontype=cla.questiontype
          mycla.name=cla.name
          mycla.created_at=cla.created_at
          mycla.updated_at=cla.updated_at
          mycla.cartype=cla.cartype
          arr.push(mycla)
          break
        end
      end
    end
    render json:arr
  end

  def classdetail
    @classdetail=Classdetail.all
    render json:@classdetail
  end

  class Myavatar
    attr :avatar,true
    attr :link,true
  end

  def topavatar
    @topavatars=Topavatar.all
    avatars=Array.new
    @topavatars.each do |topavatar|
      arr=Myavatar.new
      arr.avatar=topavatar.topavatar.url
      arr.link=topavatar.link
      avatars.push(arr)
    end
    render json:avatars
  end

  def leftavatar
    @leftavatars=Leftavatar.all
    avatars=Array.new
    @leftavatars.each do |leftavatar|
      arr=Myavatar.new
      arr.avatar=leftavatar.leftavatar.url
      arr.link=leftavatar.link
      avatars.push(arr)
    end
    render json:avatars
  end

  def avatar
    avatar=Avater.first
    arr = Myavatar.new
    arr.topavatar=avatar.topavater.url
    arr.leftavatar=avatar.leftavater.url
    render json:arr
  end


#url => 'http://apis.baidu.com'
private
  # def getip(ip)
  #   conn = Faraday.new(:url => 'http://apis.baidu.com') do |faraday|
  #     faraday.request :url_encoded # form-encode POST params
  #     faraday.response :logger # log requests to STDOUT
  #     faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
  #   end
  #   conn.headers[:apikey] = '6e1802f8c0cd1b42b32249ba42c2e602'
  #   conn.params[:ip]=ip
  #   request = conn.get do |req|
  #     req.url '/apistore/iplookup/iplookup_paid'
  #   end
  #   return request.body
  #   #debugger
  # end
def getip

  loginlog=Loginlog.last
  ip=loginlog.ip

    conn = Faraday.new(:url => 'http://ip.taobao.com') do |faraday|
      faraday.request :url_encoded # form-encode POST params
      faraday.response :logger # log requests to STDOUT
      faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
    end
    # conn.headers[:apikey] = '6e1802f8c0cd1b42b32249ba42c2e602'
    conn.params[:ip]=ip
    request = conn.get do |req|
      req.url '/service/getIpInfo.php'
    end
    #return request.body

#//////////////////////////////////////////////////////////
    #location = getip(params[:ip])
    location_json = JSON.parse(request.body)

    begin
      loc = location_json['data']['region']+' '+location_json['data']['city']+' '+location_json['data']['county']+' '+location_json['data']['isp']
    rescue
      loc=''
    end
  loginlog.location=loc
  loginlog.save
  #///////////////////////////////////////////////////////

    #debugger
end







end
