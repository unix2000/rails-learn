class CacheController < ApplicationController
	def redis
		@redis = Redis.new(:url => "redis://localhost:6379/0")
	end
end
