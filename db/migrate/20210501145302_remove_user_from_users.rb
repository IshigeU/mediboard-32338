class RemoveUserFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_id, :reference
  end
end
