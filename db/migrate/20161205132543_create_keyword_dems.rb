class CreateKeywordDems < ActiveRecord::Migration[5.0]
  def change
    create_table :keyword_dems do |t|
      t.integer :dem_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
