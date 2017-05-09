class LoginsController < ApplicationController
  def index
    firstadmin = Admin.all
    if firstadmin.count <= 0
      Admin.create(adminname:'管理员',login:'admin',password:'admin',password_confirmation:'admin')
    end

nowtime=Time.now - 86400
    nowtime=nowtime.strftime("%Y-%m-%d %H:%M:%S")
    delquestion = Question.where("isnew = '1' and created_at < "+ "'"+ nowtime.to_s+"'")
    delquestion.each do |del|
      del.destroy
    end


  end

  def create




    admin = Admin.find_by(login:params[:login][:login])
    if admin && admin.status==0 && admin.authenticate(params[:login][:password])
      redirect_to action: 'index',id:1
    else
      if admin &&  admin.authenticate(params[:login][:password])
        session[:login]= admin.login
        session[:username] = admin.adminname
        session[:auth] =  admin.auth
        session[:id]=admin.id
        redirect_to admins_path
      else
        redirect_to action: 'index',id:0
      end
    end
  end


end
