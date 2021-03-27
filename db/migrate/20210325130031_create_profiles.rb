class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer         :age_id
      t.integer         :sex_id
      t.integer         :prefecture_id
      t.text            :content
      t.string          :shop_name
      t.string          :shop_info
      t.references      :user,          null:false,foreign_key: true
      t.timestamps
    end
  end
end
