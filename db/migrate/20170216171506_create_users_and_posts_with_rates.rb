class CreateUsersAndPostsWithRates < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, unique: true

      t.index :login
    end

    create_table :posts do |t|
      t.belongs_to :user

      t.string  :name,        null: false
      t.string  :description, null: false
      t.string  :author_ip
      t.decimal :average_rate_count, precision: 3, scale: 2
    end

    create_table :rates do |t|
      t.belongs_to :post

      t.integer :value, null: false, default: 1, validates: { inclusion: { in: 1..5, as: :check } }

      t.index :value
    end
  end
end
