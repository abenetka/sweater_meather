class User < ApplicationRecord
  has_many :favorites
  validates_presence_of :email, :password
  has_secure_password

end
