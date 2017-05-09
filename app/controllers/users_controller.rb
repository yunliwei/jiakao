class UsersController < ApplicationController
  before_action :check_login
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order("updated_at DESC").paginate(page:params[:page],per_page:10)
if session[:auth].include?'all'
  @users = User.all.order("updated_at DESC").paginate(page:params[:page],per_page:10)
else
  @users=User.where("admin_id=?",session[:id]).order("updated_at DESC").paginate(page:params[:page],per_page:10)
end
    @admins=Admin.all
    #require 'md5'
    @mycpu=::Digest::MD5.hexdigest('BFEBBFFF000306C4:20161201:1:CLOUDTIMESOFT')#bfebfbff000306c3


    #c12c-7881-d171-03e5
    #BF3E-A5AC-9455-EDE4
    #5c824ae9d86c37e1db5812b5583769df
    #b5197056ce8c70bc81f489283f149e81
    #464b    71841d6842377b94c467ea267558
    #7542670a3cf536689ec3907bb112e57a
    #5C82-B519-464B-7542
    #f345c094be13e1650214c2bfd12712cd
#d600-384f-9969-987f
#8180-0320-5227-611e
#bcb1-abba-c612-776a
#be11-e165-0214-c2bf
    if params[:user]!='' && params[:user]!= nil
      @users=User.where("login like '%"+params[:user]+"%'").paginate(page:params[:page],per_page:10)

    end
    @usercount=@users.count

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @lastuser='user000'
    @myuser =User.last
    if @myuser != nil
      @lastuser=@myuser.login.to_s
    end


  @lastuser=createlogin(@lastuser,1)

  end


  def createuser

    num=0
    num=params[:num].to_i
    login = params[:startlogin].to_s
mypwdnum=params[:pwdnum]
    #mytype=params[:type]
    typenum=params[:typenum]
    typetime=params[:typetime]
    statusvalue=params[:statusvalue]
    adminid=params[:adminid]

    step=0
    createsum=0

    loop do
      locallogin=createlogin(login,step)

      temuser=User.find_by_login(locallogin)
      if(temuser)
        step=step+1
      else

        mypwd = randpassword(mypwdnum)

        User.create(login:locallogin,password:mypwd,logintype:1,loginnumber:typenum,logintime:typetime,status:statusvalue,admin_id:adminid)



        step=step+1
        createsum=createsum + 1
      end
      if(createsum>=num)
        break
      end



    end

    redirect_to users_path
  end






  # GET /users/1/edit
  def edit
     @loginlogs = @user.loginlogs

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :password, :head, :studentid, :sex, :age, :idcard, :name, :money, :model, :Subject, :logintype, :loginnumber, :logintime, :status, :admin_id)
    end


  def createlogin (login,addvalue)


    userlength=login.length.to_i-1



    login.length.times do |f|
      if login[userlength].to_s.include?('0') || login[userlength].to_s.include?('1') || login[userlength].to_s.include?('2') || login[userlength].to_s.include?('3') || login[userlength].to_s.include?('4') || login[userlength].to_s.include?('5') || login[userlength].to_s.include?('6') || login[userlength].to_s.include?('7') || login[userlength].to_s.include?('8') || login[userlength].to_s.include?('9')
        userlength=userlength-1
      else
        break
      end
    end


    usera = login[0,userlength+1]
    userb=login[userlength+1,login.length].to_i
    userb=userb+addvalue

    loop do
      temuser=usera.to_s+userb.to_s
      if temuser.length<login.length
        usera=usera+'0'
      else
        break
      end
    end


    login=usera.to_s+userb.to_s


  end



  def randpassword(passwordnum)
    mypwd=''
    passwordnum.to_i.times do
      mypwd=mypwd+rand(9).to_s
    end
    return mypwd

  end


end
