class LoginlogsController < ApplicationController
  before_action :check_login
  before_action :set_loginlog, only: [:show, :edit, :update, :destroy]

  def index
    #@loginlogs = Loginlog.all.order("updated_at DESC").paginate(page:params[:page],per_page:10)

    @loginlogs = Loginlog.find_by_sql("select users.login,loginlogs.* from users,loginlogs where users.id = loginlogs.user_id")
    #@loginlogs=@loginlogs.paginate(page:params[:page],per_page:10)
    #@users=User.all


    @loginlogcount=@loginlogs.count

  end
  def show
  end

  # GET /users/new
  def new

  end

  def set_loginlog
    @loginlog = Loginlog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def loginlog_params
    params.require(:loginlog).permit(:user_id ,:ip,:location)
  end
end
