class RemoveFinallocationFromBoat < ActiveRecord::Migration
  def change
    remove_column :boats, :finallocation, :string
  end
end
