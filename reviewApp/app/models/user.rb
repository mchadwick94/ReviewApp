class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  has_one :profiles, dependent: :destroy
  has_many :reviews, dependent: :destroy


##


##
end
