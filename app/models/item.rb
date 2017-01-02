class Item < ApplicationRecord
	self.primary_key = "id"
	self.table_name = "items"
	
	# will_paginate
	# self.per_page = 10
	
	# kaminari 
	paginates_per 8
end
