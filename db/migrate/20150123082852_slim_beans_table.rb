class SlimBeansTable < ActiveRecord::Migration
  def change
    remove_column :beans, :rating
    remove_column :beans, :review_date
    remove_column :beans, :description
  end
end