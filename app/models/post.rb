class Post < ActiveRecord::Base
  belongs_to :user
  has_many :rates, dependent: :destroy

  validates :name, :description, presence: true

  scope :most_popular, ->(number) { joins(:rates).group('posts.id').order('average_rate_count DESC NULLS LAST').limit(number) }
end

