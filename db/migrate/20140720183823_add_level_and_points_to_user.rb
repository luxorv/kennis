class AddLevelAndPointsToUser < ActiveRecord::Migration
  def change
    add_column :users, :level, :integer
    add_column :users, :points, :integer
  end
end
