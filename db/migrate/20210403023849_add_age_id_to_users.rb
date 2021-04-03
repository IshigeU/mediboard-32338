class AddAgeIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age_id, :integer
  end
end
