class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  def fullname
    "#{first_name} #{last_name}"
  end
end
