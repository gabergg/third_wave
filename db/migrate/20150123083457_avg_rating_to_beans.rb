class AvgRatingToBeans < ActiveRecord::Migration
  def change
    add_column :beans, :avg_rating, :float
  end
end
