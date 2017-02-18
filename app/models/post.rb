class Post < ActiveRecord::Base
  belongs_to :user
  has_many :rates, dependent: :destroy

  validates :name, :description, presence: true

  scope :most_popular, ->(number) { joins(:rates).group('posts.id').order('AVG(rates.value) DESC').limit(number) }

  def average_rate
    rates.average(:value).round(2)
  end  
end

