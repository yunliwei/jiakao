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
    loc=''
begin
    location = getip(params[:ip])
    location_json = JSON.parse(location)
    #pp test
    loc = location_json['retData']['province']+'省 '+location_json['retData']['city']+'市 '+location_json['retData']['carrier']
rescue
  loc=''
  end
      login=params[:login]
    validate=params[:validate]
#login = 'add86'

    myuser=User.find_by_login(login)
    myvalidate=::Digest::MD5.hexdigest(myuser.login+myuser.password+myuser.remoteval+'CLOUDTIMESOFT')

    myvalidate.to_s.upcase!    #if myvalidate == validate && Time.parse(myvalidate.updated_at)
    usertime= myuser.updated_at
    nowtime=Time.now
    if nowtime - DateTime.parse(usertime.to_s) < 10 && validate==myvalidate
      render json:(myuser)
      if myuser.logintype=='0'

        #'http://apis.baidu.com/apistore/iplookupservice/iplookup?ip=117.89.35.58 -H apikey:6e1802f8c0cd1b42b32249ba42c2e602y'


#location = getip(params[:ip])

         myuser.loginnumber= myuser.loginnumber.to_i - 1
        myuser.save
      end
      Loginlog.create(user_id:myuser.id,ip:params[:ip],location:loc)
    else
      render json:('[{"status":"error"}]')
      end

  end

private
def getip(ip)
  conn = Faraday.new(:url => 'http://apis.baidu.com') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end
  conn.headers[:apikey] = '6e1802f8c0cd1b42b32249ba42c2e602'
  conn.params[:ip]=ip
  request = conn.get do |req|
    req.url '/apistore/iplookupservice/iplookup'
    #req.params['ip'] = '117.89.35.58'
    #req.headers['apikey'] = '6e1802f8c0cd1b42b32249ba42c2e602'
  end
  return request.body

end



end
