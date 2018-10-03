class User < ApplicationRecord
  has_many :blogs

  validates :first_name, :presence => true
  validates :last_name, :presence => true
end
