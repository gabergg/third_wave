class ReorgBeansTableWithRoasters < ActiveRecord::Migration
  def change
    remove_column :beans, :roaster
    remove_column :beans, :location
    add_column :beans, :roaster_id, :integer
  end
end