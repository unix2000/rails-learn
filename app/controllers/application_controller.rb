class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 前置过滤器 
  # 过滤器使用方法
  # 1、直接在 *_action 方法中使用代码块
  # before_action do |controller|
  #   unless controller.send(:logged_in?)
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url
  #   end
  # end
  # before_action :require_login #def
  # 2、使用class
  # before_action LoginFilter #class
  
  # 后置过滤


end

class LoginFilter
  def self.before(controller)
    unless controller.send(:logged_in?)
      controller.flash[:error] = "You must be logged in to access this section"
      controller.redirect_to controller.new_login_url
    end
  end
end
