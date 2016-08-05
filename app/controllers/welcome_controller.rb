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
		# response.cookies.clear

	end

	def tests
		data = Event.all
		render json: data
	end
	def dirs
		@files = Dir.glob("*")
	end
end
