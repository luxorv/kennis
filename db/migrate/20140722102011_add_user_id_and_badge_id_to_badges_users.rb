class AddUserIdAndBadgeIdToBadgesUsers < ActiveRecord::Migration
  def change
    add_column :badges_users, :user_id, :integer
    add_column :badges_users, :badge_id, :integer
  end
end
