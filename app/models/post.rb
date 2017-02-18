class Post < ActiveRecord::Base
  belongs_to :user
  has_many :rates, dependent: :destroy

  validates :name, :description, presence: true

  def average_rate
    rates.average(:value).round(2)
  end  
end
