class Post < ActiveRecord::Base
  belongs_to :user
  has_many :rates, dependent: :destroy

  validates :title, :description, presence: true
end
