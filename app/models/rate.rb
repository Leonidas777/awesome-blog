class Rate < ActiveRecord::Base
  belongs_to :post

  validates :value, inclusion: { in: 1..5 }
  validates :value, presence: true

  after_create :caclucate_average_post_rate

  private

  def caclucate_average_post_rate
    average_rate = post.rates.average(:value).round(2) if post.rates.any?

    post.update!(average_rate_count: average_rate)
  end
end
