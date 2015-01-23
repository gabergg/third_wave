class ReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :rating
      t.string :brew_method
      t.text :description
      t.integer :user_id
      t.integer :bean_id

      t.timestamps
    end
    add_index :reviews, [:rating, :user_id, :bean_id, :created_at]
  end
end