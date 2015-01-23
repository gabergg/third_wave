class DefaultZeroNumRatings < ActiveRecord::Migration
  def change
    change_column :beans, :num_ratings, :integer, :default => 0
    change_column :beans, :avg_rating, :float, :default => 0
  end
end