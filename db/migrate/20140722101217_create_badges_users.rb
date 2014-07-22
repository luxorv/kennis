class CreateBadgesUsers < ActiveRecord::Migration
  def change
    create_table :badges_users do |t|

      t.timestamps
    end
  end
end
