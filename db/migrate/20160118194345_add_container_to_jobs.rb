class AddContainerToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :containers, :integer
  end
end
