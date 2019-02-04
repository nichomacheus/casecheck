class Hospital < ApplicationRecord
	validates :state, length: { maximum: 2 }

end
