class AddUniqueConstraintToUsersScreenName < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :screen_name, unique: true
  end
end
