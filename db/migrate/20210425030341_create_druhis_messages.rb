class CreateDruhisMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :druhis_messages do |t|
      t.text            :text
      t.references      :user,          null:false,foreign_key: true
      t.references      :drug_history,  null:false,foreign_key: true
      t.timestamps
    end
  end
end
