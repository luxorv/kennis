class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.integer :points
      t.string :topic

      t.timestamps
    end
  end
end
