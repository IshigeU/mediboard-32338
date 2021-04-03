class AddShopInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :shop_info, :string
  end
end
