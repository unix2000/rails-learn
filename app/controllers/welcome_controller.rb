class WelcomeController < ApplicationController
	def index
		
	end

	def req
		# request.host
		# request.ssl?
		# request.cookies
		# request.params
		if request.method == 'GET'
			@name = "IS GET"
			puts 'is get'
		end
		@req = request
	end

	def res
		# render html: "html output"
		# response.cookies.clear
		@res = response
	end

	def tests
		# data = Event.all
		# render json: data
		# @name = "liner.xie"
		
		# 参数获取params
		# @name = params
		
		# request组件
		# ActionDispatch::Request
		# @name = request
		# puts request.remote_ip
		# puts request.user_agent
		# puts request.get? #true
		# puts request.post? #false
		# puts request.port #3000
		# puts request.GET #{ }
		# puts request.POST #{ }

		# response组件
		# ActionDispatch::Response
		# @name = response
		
		# session组件
		# ActionDispatch::Request::Session
		# @name = session
		
		# cookies组件
		# ActionDispatch::Cookies::CookieJar
		# @name = cookies

		# flash组件
		# ActionDispatch::Flash::FlashHash
		# @name = flash

		# @name = ActionController::HttpAuthentication

	end
	def dirs
		@files = Dir.glob("*")
	end
end
