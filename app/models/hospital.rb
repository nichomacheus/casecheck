class Hospital < ApplicationRecord
	validates :state, length: { maximum: 2 }
	before_save :upcase_fields


	def upcase_fields
	  self.city.upcase!
	  self.state.upcase!
	  self.address.upcase!
	end

end
