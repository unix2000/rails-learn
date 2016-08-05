class ItemsController < ApplicationController
	def index
		# @items = Item.all
		# @items = Item.take(20)
		# @items = Item.first(15)
		require 'will_paginate'
		@items = Item.paginate(:page => params[:page], :per_page => 30)
	end
end