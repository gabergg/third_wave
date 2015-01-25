class AddRoastersTable < ActiveRecord::Migration
  def change
    create_table :roasters do |t|

      t.string :name
      t.string :location
      t.float :avg_rating
      t.text :description, :limit => nil

      t.timestamps
    end

    add_index :roasters, :name
    add_index :roasters, :location
    add_index :roasters, :avg_rating
    
  end
end
