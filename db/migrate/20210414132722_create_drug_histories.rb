class CreateDrugHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :drug_histories do |t|
      t.string         :hp_name
      t.text           :text
      t.datetime       :start_time
      t.references     :user, null: false, foreign_key: true
      t.integer        :height_id
      t.integer        :weight_id
      t.integer        :pressure_id
      t.integer        :wbc_id
      t.integer        :hb_id
      t.integer        :plt_id
      t.integer        :pt_inr_id
      t.integer        :ast_id
      t.integer        :alt_id
      t.integer        :gdp_id
      t.integer        :scr_id
      t.integer        :egfr_id
      t.integer        :cpk_id
      t.integer        :crp_id
      t.integer        :k_id
      t.integer        :hba1c_id
      t.timestamps
    end
  end
end
