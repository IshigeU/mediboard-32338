class AddJobToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :job_id, :integer
  end
end
