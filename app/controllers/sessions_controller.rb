class SessionsController < ApplicationController
  def new
  	
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面
      log_in user
      redirect_to user
    else
      # 创建一个错误消息
      flash.now[:danger] = "用户名或密码错误!"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
    #helper里定义显示未定义函数 ? helper定义的函数好像只能在模板里有效
    #版本rails 5.0.0.1 非得require么
    def log_in(user)
      session[:user_id] = user.id
    end
    # # 退出当前用户
    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
end
