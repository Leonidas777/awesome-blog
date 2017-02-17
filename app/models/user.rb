class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :login, uniqueness: true, presence: true
end
