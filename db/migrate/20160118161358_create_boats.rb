class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :capacity
      t.string :location
      t.references :user

      t.timestamps null: false
    end
  end
end
