class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_updatecheck
    if Updatecheck.count >0
      checkupdate = Updatecheck.first
      checkupdate.updatecheck=UUIDTools::UUID.timestamp_create
      checkupdate.save
    else
      Updatecheck.create(updatecheck: UUIDTools::UUID.timestamp_create)
    end
  end


  def check_login
    if session[:login] == nil || session == ''
      redirect_to logins_path
    end
  end

end
