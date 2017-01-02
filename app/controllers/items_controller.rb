class ItemsController < ApplicationController
	def index
		# @items = Item.all
		# @items = Item.take(20)
		# @items = Item.first(15)
		# require 'will_pagkaminariinate'
		# paginate在helper已重新定义
		# @items = Item.paginate(:page => params[:page], :per_page => 8)
		
		# kaminari
		@items = Item.order(:id).page params[:page]
	end
end