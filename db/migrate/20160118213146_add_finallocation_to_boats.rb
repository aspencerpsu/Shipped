class AddFinallocationToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :finallocation, :string
  end
end
