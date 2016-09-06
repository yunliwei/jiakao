class LoginsController < ApplicationController
  def index

  end

  def create

    admin = Admin.find_by(login:params[:login][:login])
    if admin && admin.status==0 && admin.authenticate(params[:login][:password])




      redirect_to action: 'index',id:1

    else
      if admin &&  admin.authenticate(params[:login][:password])
        session[:login]= admin.login
        session[:username] = admin.adminname
        redirect_to admins_path
      else
        redirect_to action: 'index',id:0
      end
    end
  end


end
