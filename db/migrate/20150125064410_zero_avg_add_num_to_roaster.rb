class ZeroAvgAddNumToRoaster < ActiveRecord::Migration
  def change
    add_column :roasters, :num_ratings, :integer, :default => 0
    change_column :roasters, :avg_rating, :float, :default => 0
  end
end
