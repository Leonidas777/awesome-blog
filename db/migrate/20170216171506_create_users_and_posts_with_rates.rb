class CreateUsersAndPostsWithRates < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, unique: true
    end

    create_table :posts do |t|
      t.belongs_to :user

      t.string :name,       null: false
      t.string :description, null: false
      t.string :author_ip
    end

    create_table :rates do |t|
      t.belongs_to :post
      t.integer :value, null: false, validates: { inclusion: { in: 1..5, as: :check } }
    end
  end
end
