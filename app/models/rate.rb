class Rate < ActiveRecord::Base
  belongs_to :post

  enforce_migration_validations

  validates :value, presence: true
end
