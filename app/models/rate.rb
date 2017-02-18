class Rate < ActiveRecord::Base
  belongs_to :post

  validates :value, inclusion: { in: 1..5 }
  validates :value, presence: true
end
