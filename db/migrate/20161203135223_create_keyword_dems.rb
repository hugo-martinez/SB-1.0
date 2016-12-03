class CreateKeywordDems < ActiveRecord::Migration[5.0]
  def change
    create_table :keyword_dems do |t|
      t.integer :dem_id
      t.string :keyword

      t.timestamps
    end
  end
end
