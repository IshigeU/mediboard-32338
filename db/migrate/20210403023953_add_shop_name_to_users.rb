class AddShopNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :shop_name, :string
  end
end
