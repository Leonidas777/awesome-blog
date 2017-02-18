class Post < ActiveRecord::Base
  belongs_to :user
  has_many :rates, dependent: :destroy

  validates :name, :description, presence: true
end
