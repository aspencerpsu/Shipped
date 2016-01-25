class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :cargo
      t.string :destination
      t.references :boat, index: true, foreign_key: true
      t.decimal :price, precision: 5, scale: 2
      t.string :origin

      t.timestamps null: false
    end
  end
end
