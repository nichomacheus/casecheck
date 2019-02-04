class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
validates_confirmation_of :password

end
