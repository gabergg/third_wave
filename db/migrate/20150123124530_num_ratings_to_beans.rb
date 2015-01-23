class NumRatingsToBeans < ActiveRecord::Migration
  def change
    add_column :beans, :num_ratings, :integer
  end
end