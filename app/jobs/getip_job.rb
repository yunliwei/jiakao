class GetipJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later

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
