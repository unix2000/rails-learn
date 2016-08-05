class Item < ApplicationRecord
	self.primary_key = "id"
	self.table_name = "items"
	self.per_page = 10
end
