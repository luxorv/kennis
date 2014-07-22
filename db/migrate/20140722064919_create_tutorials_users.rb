class CreateTutorialsUsers < ActiveRecord::Migration
  def change
    create_table :tutorials_users do |t|
      t.integer :user_id
      t.integer :tutorial_id

      t.timestamps
    end
  end
end
